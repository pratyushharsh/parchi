import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


import '../../config/theme_settings.dart';
import '../../entity/pos/contact_entity.dart';
import '../../widgets/address_widget.dart';
import '../../widgets/appbar_leading.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_checkbox.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/desktop_pop_up.dart';
import '../../widgets/loading.dart';
import '../../widgets/my_loader.dart';
import '../business/business_view.dart';
import '../list_all_receipt/list_all_receipt_view.dart';
import 'bloc/create_edit_customer_bloc.dart';
import 'bloc/customer_form_bloc.dart';
import 'customer_validator.dart';

class NewCustomerView extends StatelessWidget {
  final String? customerId;
  const NewCustomerView({Key? key, this.customerId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          lazy: false,
          create: (context) => CreateEditCustomerBloc(
              sequenceRepository: RepositoryProvider.of(context),
              customerRepository: RepositoryProvider.of(context),
              editMode: customerId != null,
              customerId: customerId)
            ..add(OnEditCustomer()),
        ),
        BlocProvider(
          create: (context) => CustomerFormBloc(),
        ),
      ],
      child: BlocListener<CreateEditCustomerBloc, CreateEditCustomerState>(
          listener: (context, state) {
            if (state.status == CreateEditCustomerStatus.addingCustomer) {
              showLoadingDialog(context);
            } else if (state.status == CreateEditCustomerStatus.addingFailure) {
              Navigator.of(context).pop();
              const snackBar = SnackBar(
                content: Text('Error Saving the customer.'),
                backgroundColor: Colors.red,
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            } else if (state.status == CreateEditCustomerStatus.addingSuccess) {
              Navigator.of(context).pop();
              const snackBar = SnackBar(
                content: Text('Successfully Created Customer'),
                backgroundColor: Colors.green,
                elevation: 5,
                duration: Duration(milliseconds: 1500),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
              Navigator.of(context).pop();
            } else if (state.status ==
                CreateEditCustomerStatus.loadedExistingCustomer) {
              if (state.customer != null) {
                BlocProvider.of<CustomerFormBloc>(context)
                    .add(LoadCustomer(state.customer!));
              }
            }

            if (state.mode == CustomerDisplayMode.create) {
              BlocProvider.of<CustomerFormBloc>(context).add(NewCustomer());
            }
          },
          child: const CreateNewCustomerForm()),
    );
  }
}

class CreateNewCustomerForm extends StatefulWidget {
  const CreateNewCustomerForm({Key? key}) : super(key: key);

  @override
  State<CreateNewCustomerForm> createState() => _CreateNewCustomerFormState();
}

class _CreateNewCustomerFormState extends State<CreateNewCustomerForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Form(
            key: _formKey,
            onChanged: () {},
            autovalidateMode: AutovalidateMode.always,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Positioned(
                  top: 60,
                  left: 0,
                  right: 0,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height - 60,
                    child: const CustomerTabs(),
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: BlurryContainer(
                    blur: 8,
                    height: 70,
                    elevation: 0,
                    borderRadius: const BorderRadius.all(Radius.circular(0)),
                    color: Colors.white.withOpacity(0.6),
                    child: const SizedBox(
                      height: 70,
                    ),
                  ),
                ),
                BlocBuilder<CreateEditCustomerBloc, CreateEditCustomerState>(
                  builder: (context, state) {
                    return Positioned(
                      top: 20,
                      left: 16,
                      child: AppBarLeading(
                        heading: state.mode == CustomerDisplayMode.create
                            ? "New Party"
                            : "Customer # ${state.customer?.contactId} | ${state.customer?.firstName} ${state.customer?.lastName}",
                        icon: Icons.arrow_back,
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    );
                  },
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        Expanded(
                          child: RejectButton(
                              label: "Cancel",
                              onPressed: () {
                                Navigator.of(context).pop();
                              }),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        BlocBuilder<CustomerFormBloc, CustomerFormState>(
                          builder: (context, state) {
                            return Expanded(
                              child: AcceptButton(
                                label: "Save",
                                onPressed: () {
                                  ContactEntity ce = ContactEntity(
                                    firstName: state.firstName!,
                                    lastName: state.lastName!,
                                    createTime: DateTime.now(),
                                    billingAddress: state.billingAddress,
                                    shippingAddress: state.shippingAddress,
                                    email: state.email,
                                    gstin: state.gstin,
                                    panCard: state.panCard,
                                    phoneNumber: state.phoneNumber,
                                    contactId: state.contactId ?? 'Dummy',
                                    storeId: '-1',
                                  );
                                  BlocProvider.of<CreateEditCustomerBloc>(
                                          context)
                                      .add(OnCreateCustomer(customer: ce));
                                },
                              ),
                            );
                          },
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomerTabs extends StatelessWidget {
  const CustomerTabs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateEditCustomerBloc, CreateEditCustomerState>(
      builder: (context, state) {
        return DefaultTabController(
          length: state.mode == CustomerDisplayMode.create ? 1 : 2,
          child: Column(
            children: [
              TabBar(
                indicatorColor: AppColor.primary,
                unselectedLabelColor: AppColor.subtitleColorPrimary,
                labelColor: AppColor.primary,
                tabs: [
                  if (state.mode != CustomerDisplayMode.create)
                    const Tab(
                        icon: FaIcon(
                          FontAwesomeIcons.list,
                        ),
                        iconMargin: EdgeInsets.only(bottom: 6, top: 15),
                        text: "Purchase History"),
                  const Tab(
                      icon: FaIcon(FontAwesomeIcons.circleUser),
                      iconMargin: EdgeInsets.only(bottom: 6, top: 15),
                      text: "Customer Detail"),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    if (state.mode != CustomerDisplayMode.create)
                      const CustomerPurchaseListDisplay(),
                    const CreateCustomerForm(),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

class CustomerPurchaseListDisplay extends StatelessWidget {
  const CustomerPurchaseListDisplay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateEditCustomerBloc, CreateEditCustomerState>(
      builder: (context, state) {
        if (state.purchaseHistory.isNotEmpty) {
          return ListView.builder(
              itemCount: state.purchaseHistory.length,
              itemBuilder: (ctx, idx) {
                return ReceiptHeaderCard(receipt: state.purchaseHistory[idx]);
              });
        }
        return Container();
      },
    );
  }
}

class CreateCustomerForm extends StatelessWidget {
  const CreateCustomerForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustomerFormBloc, CustomerFormState>(
      builder: (context, state) {
        if (state.status == CustomerFormStatus.loadedExistingCustomer ||
            state.status == CustomerFormStatus.initial) {
          return const Center(
            child: MyLoader(),
          );
        }

        return SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Column(
              children: [
                CustomTextField(
                  label: "First Name",
                  validator: NewPartyFieldValidator.validatePartyName,
                  initialValue: state.firstName,
                  onValueChange: (value) {
                    BlocProvider.of<CustomerFormBloc>(context)
                        .add(OnCustomerFirstNameChange(firstName: value));
                  },
                ),
                CustomTextField(
                  label: "Last Name",
                  validator: NewPartyFieldValidator.validatePartyName,
                  initialValue: state.lastName,
                  onValueChange: (value) {
                    BlocProvider.of<CustomerFormBloc>(context)
                        .add(OnCustomerLastNameChange(lastName: value));
                  },
                ),
                CustomTextField(
                  label: "Contact No.",
                  textInputType: TextInputType.phone,
                  initialValue: state.phoneNumber,
                  onValueChange: (value) {
                    BlocProvider.of<CustomerFormBloc>(context)
                        .add(OnCustomerPhoneNumberChange(phoneNumber: value));
                  },
                ),
                CustomTextField(
                  label: "Email",
                  validator: NewPartyFieldValidator.validatePartyEmail,
                  textInputType: TextInputType.emailAddress,
                  initialValue: state.email,
                  onValueChange: (value) {
                    BlocProvider.of<CustomerFormBloc>(context)
                        .add(OnCustomerEmailChange(email: value));
                  },
                ),
                CustomTextField(
                  label: "GST",
                  textInputType: TextInputType.phone,
                  initialValue: state.gstin,
                  onValueChange: (value) {
                    BlocProvider.of<CustomerFormBloc>(context)
                        .add(OnCustomerGstinChange(gstin: value));
                  },
                ),
                CustomTextField(
                  label: "PAN",
                  textInputType: TextInputType.phone,
                  initialValue: state.panCard,
                  onValueChange: (value) {
                    BlocProvider.of<CustomerFormBloc>(context)
                        .add(OnCustomerPanCardChange(panCard: value));
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    CustomCheckbox(
                      value: state.sameAddress,
                      onChanged: (bool value) {
                        BlocProvider.of<CustomerFormBloc>(context).add(
                            OnBillingAddressSameAsShippingAddress(
                                sameAddress: value));
                      },
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      "Billing address is same as shipping address.",
                      style: TextStyle(color: AppColor.formInputText),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    showTransitiveAppPopUp(
                      context: context,
                      title: "Billing Address",
                      child: const AddressFormDialog(),
                    ).then((value) => {
                          if (value != null)
                            {
                              BlocProvider.of<CustomerFormBloc>(context).add(
                                  OnCustomerBillingAddressChange(
                                      billingAddress: value))
                            }
                        });
                  },
                  child: TextFieldPlaceholderWidget(
                    label: "Billing Address",
                    value: state.billingAddress?.toString() ?? "",
                  ),
                ),
                if (!state.sameAddress)
                  GestureDetector(
                    onTap: () {
                      showTransitiveAppPopUp(
                        context: context,
                        title: "Shipping Address",
                        child: const AddressFormDialog(),
                      ).then((value) => {
                            if (value != null)
                              {
                                BlocProvider.of<CustomerFormBloc>(context).add(
                                    OnCustomerShippingAddressChange(
                                        shippingAddress: value))
                              }
                          });
                    },
                    child: TextFieldPlaceholderWidget(
                      label: "Shipping Address",
                      value: state.shippingAddress?.toString() ?? "",
                    ),
                  ),
                const SizedBox(
                  height: 250,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
