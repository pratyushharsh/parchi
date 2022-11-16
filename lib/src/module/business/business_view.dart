import 'package:flutter/material.dart';
import "dart:io";
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../config/theme_settings.dart';
import '../../entity/config/code_value_entity.dart';
import '../../entity/pos/address.dart';
import '../../entity/pos/business_entity.dart';
import '../../repositories/repository.dart';
import '../../widgets/address_widget.dart';
import '../../widgets/appbar_leading.dart';
import '../../widgets/code_value_dropdown.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/desktop_pop_up.dart';
import '../../widgets/my_loader.dart';
import '../authentication/bloc/authentication_bloc.dart';
import 'bloc/business_bloc.dart';
import 'business_validator.dart';

class BusinessView extends StatelessWidget {
  final BusinessOperation operation;
  final int? businessId;

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const BusinessView());
  }

  const BusinessView(
      {Key? key, this.operation = BusinessOperation.create, this.businessId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BusinessBloc(
          userPool: RepositoryProvider.of(context),
          repo: RepositoryProvider.of(context),
          authBloc: BlocProvider.of(context),
          operation: operation)
        ..add(LoadBusinessDetail(businessId)),
      child: Container(
        color: Colors.white,
        child: SafeArea(
          child: Scaffold(
            resizeToAvoidBottomInset: true,
            backgroundColor: Colors.white,
            body: Stack(
              fit: StackFit.expand,
              children: [
                SingleChildScrollView(
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    child: Column(
                      children: const [
                        SizedBox(
                          height: 70,
                        ),
                        BusinessLogo(),
                        SizedBox(
                          height: 20,
                        ),
                        BusinessDetail()
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 20,
                  left: 16,
                  child: AppBarLeading(
                    heading: operation == BusinessOperation.update
                        ? "Modify Business# $businessId"
                        : "Create Business",
                    icon: operation == BusinessOperation.update
                        ? Icons.arrow_back
                        : null,
                    onTap: operation == BusinessOperation.update
                        ? () {
                            Navigator.of(context).pop();
                          }
                        : null,
                  ),
                ),
                BlocBuilder<BusinessBloc, BusinessState>(
                  builder: (context, state) {
                    if (BusinessStatus.modified == state.status && state.error) {
                      return Positioned(
                        top: 20,
                        right: 16,
                        child: ElevatedButton(
                          onPressed: () {
                            if (BusinessOperation.create == state.operation) {
                              BlocProvider.of<BusinessBloc>(context)
                                  .add(OnCreateNewBusiness());
                            } else {
                              BlocProvider.of<BusinessBloc>(context)
                                  .add(OnSaveBusiness());
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: AppColor.color8,
                            padding: const EdgeInsets.symmetric(
                              vertical: 14,
                              horizontal: 10,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                          child: const Text(
                            "Save",
                            style: TextStyle(color: AppColor.primary),
                          ),
                        ),
                      );
                    }
                    return Container();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BusinessDetail extends StatefulWidget {
  const BusinessDetail({Key? key}) : super(key: key);

  @override
  State<BusinessDetail> createState() => _BusinessDetailState();
}

class _BusinessDetailState extends State<BusinessDetail> {
  late TextEditingController _businessNameController;
  late TextEditingController _legalBusinessNameController;
  late TextEditingController _businessContactController;
  late TextEditingController _businessEmailController;
  late TextEditingController _businessGstController;
  late TextEditingController _businessPanController;
  late CodeValueEntity? _selectedCurrency;
  late CodeValueEntity? _selectedLocale;

  @override
  void initState() {
    super.initState();
    _businessNameController = TextEditingController();
    _legalBusinessNameController = TextEditingController();
    _businessContactController = TextEditingController();
    _businessEmailController = TextEditingController();
    _businessGstController = TextEditingController();
    _businessPanController = TextEditingController();
    _selectedCurrency = null;
    _selectedLocale = null;
  }

  @override
  void dispose() {
    _businessNameController.dispose();
    _legalBusinessNameController.dispose();
    _businessContactController.dispose();
    _businessEmailController.dispose();
    _businessGstController.dispose();
    _businessPanController.dispose();
    super.dispose();
  }

  void _onSelectedCurrencyChanged(CodeValueEntity? value) {
    setState(() {
      _selectedCurrency = value;
      if (value != null) {
        BlocProvider.of<BusinessBloc>(context)
            .add(OnChangeBusinessCurrency(value.code));
      }
    });
  }

  void _onSelectedLocaleChanged(CodeValueEntity? value) {
    setState(() {
      _selectedLocale = value;
      if (value != null) {
        BlocProvider.of<BusinessBloc>(context)
            .add(OnChangeBusinessLocale(value.code));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BusinessBloc, BusinessState>(
      listener: (context, state) {
        if (BusinessStatus.newBusinessCreated == state.status) {
          BlocProvider.of<AuthenticationBloc>(context).add(InitialAuthEvent());
        }
      },
      builder: (context, state) {
        if (BusinessStatus.loading == state.status) {
          return const MyLoader(
            color: AppColor.primary,
          );
        }
        if (BusinessStatus.success == state.status) {
          _businessNameController.text = state.businessName;
          _businessContactController.text = state.businessContact;
          _businessEmailController.text = state.businessEmail ?? "";
          _businessGstController.text = state.businessGst;
          _businessPanController.text = state.businessPan;
          _legalBusinessNameController.text = state.legalBusinessName;

          _selectedCurrency = RepositoryProvider.of<ConfigRepository>(context)
              .getCodeByCategoryAndCode('CURRENCY', state.businessCurrency);
          _selectedLocale = RepositoryProvider.of<ConfigRepository>(context)
              .getCodeByCategoryAndCode('LOCALE', state.businessLocale);
        }
        return Column(
          children: [
            CustomTextField(
              controller: _businessNameController,
              label: "Business Name",
              onValueChange: (val) {
                BlocProvider.of<BusinessBloc>(context)
                    .add(OnBusinessNameChange(val));
              },
              validator: BusinessValidator.businessName,
            ),
            CustomTextField(
              controller: _legalBusinessNameController,
              label: "Legal Business Name",
              onValueChange: (val) {
                BlocProvider.of<BusinessBloc>(context)
                    .add(OnLegalBusinessNameChange(val));
              },
              validator: BusinessValidator.legalBusinessName,
            ),
            CodeValueDropDown(
              category: "CURRENCY",
              onChanged: _onSelectedCurrencyChanged,
              label: "Currency",
              value: _selectedCurrency,
              builder: (code) {
                return '${code.code} - ${code.description}';
              },
              validator: BusinessValidator.businessCurrency,
            ),
            CodeValueDropDown(
              category: "LOCALE",
              onChanged: _onSelectedLocaleChanged,
              label: "Locale",
              value: _selectedLocale,
              validator: BusinessValidator.businessLocale,
            ),
            CustomTextField(
              controller: _businessContactController,
              label: "Business Contact",
              onValueChange: (val) {
                BlocProvider.of<BusinessBloc>(context)
                    .add(OnBusinessContactChange(val));
              },
              textInputType: TextInputType.phone,
              validator: BusinessValidator.businessContact,
            ),
            CustomTextField(
              controller: _businessEmailController,
              label: "Email",
              textInputType: TextInputType.emailAddress,
              onValueChange: (val) {
                BlocProvider.of<BusinessBloc>(context)
                    .add(OnBusinessEmailChange(val));
              },
              validator: BusinessValidator.businessEmail,
            ),
            GestureDetector(
              onTap: () {
                showTransitiveAppPopUp(
                  context: context,
                  title: "Business Address",
                  child: AddressFormDialog(address: state.businessAddress),
                ).then(
                  (value) => {
                    if (value != null && value is Address)
                      {
                        BlocProvider.of<BusinessBloc>(context)
                            .add(OnBusinessAddressChange(value))
                      }
                  },
                );
              },
              child: TextFieldPlaceholderWidget<Address>(
                label: "Business Address",
                value: state.businessAddress,
                validator: BusinessValidator.businessAddress,
              ),
            ),
            CustomTextField(
              controller: _businessGstController,
              label: "GST Number",
              textCapitalization: TextCapitalization.characters,
              onValueChange: (val) {
                BlocProvider.of<BusinessBloc>(context)
                    .add(OnBusinessGstChange(val.toUpperCase()));
              },
            ),
            CustomTextField(
              controller: _businessPanController,
              label: "PAN Number",
              textCapitalization: TextCapitalization.characters,
              onValueChange: (val) {
                BlocProvider.of<BusinessBloc>(context)
                    .add(OnBusinessPanChange(val.toUpperCase()));
              },
            ),
            const SizedBox(
              height: 100,
            )
          ],
        );
      },
    );
  }
}

class AddressFormDialog extends StatefulWidget {
  final Address? address;
  const AddressFormDialog({Key? key, this.address}) : super(key: key);

  @override
  State<AddressFormDialog> createState() => _AddressFormDialogState();
}

class _AddressFormDialogState extends State<AddressFormDialog> {
  late TextEditingController _zipcodeController;
  late TextEditingController _buildingController;
  late TextEditingController _streetController;
  late TextEditingController _cityController;
  // late String? _country;
  late CodeValueEntity? _selectedCountry;
  late CodeValueEntity? _selectedState;

  @override
  void initState() {
    super.initState();
    _zipcodeController = TextEditingController();
    _buildingController = TextEditingController();
    _streetController = TextEditingController();
    _cityController = TextEditingController();
    _selectedCountry = null;
    _selectedState = null;
    // _fetchData();
    if (widget.address != null) {
      _zipcodeController.text = widget.address!.zipcode ?? '';
      _buildingController.text = widget.address!.address1 ?? '';
      _streetController.text = widget.address!.address2 ?? '';
      _cityController.text = widget.address!.city ?? '';
      _selectedCountry = RepositoryProvider.of<ConfigRepository>(context)
          .getCodeByCategoryAndCode(
              'COUNTRY', widget.address!.countryCode);
      if (widget.address!.countryCode != null) {
        _selectedState = RepositoryProvider.of<ConfigRepository>(context)
            .getCodeByCategoryAndCode('${widget.address!.countryCode}_STATES', widget.address!.stateCode);
      }

    }
  }

  @override
  void dispose() {
    _zipcodeController.dispose();
    _buildingController.dispose();
    _streetController.dispose();
    _cityController.dispose();
    super.dispose();
  }

  // void _fetchData() async {
  //   var repo = RepositoryProvider.of<ConfigRepository>(context);
  //   var countryCode = await repo.getCodeByCategory("COUNTRY_CODE");
  //   var stateCode = await repo.getCodeByCategory("IN_STATE");
  //   setState(() {
  //     this.countryCode = countryCode;
  //     this.stateCode = stateCode;
  //   });
  // }

  void _onSelectedCountryChange(CodeValueEntity? value) {
    setState(() {
      _selectedCountry = value;
      _selectedState = null;
    });
  }

  void _onStateChange(CodeValueEntity? value) {
    setState(() {
      _selectedState = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                CodeValueDropDown(
                  category: "COUNTRY",
                  onChanged: _onSelectedCountryChange,
                  label: "Country",
                  value: _selectedCountry,
                ),
                CustomTextField(
                  label: "Pincode",
                  controller: _zipcodeController,
                  textInputType: TextInputType.number,
                ),
                CustomTextField(
                  label: "Building, Company, Apartment",
                  controller: _buildingController,
                ),
                CustomTextField(
                  label: "Area, Street",
                  controller: _streetController,
                ),
                CustomTextField(
                  label: "Town/City",
                  controller: _cityController,
                ),
                CodeValueDropDown(
                  enabled: _selectedCountry != null,
                  category: "${_selectedCountry?.code}_STATES",
                  onChanged: _onStateChange,
                  label: "State",
                  value: _selectedState,
                ),
                const SizedBox(
                  height: 100,
                )
              ],
            ),
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: AcceptButton(
            label: "Save",
            borderRadius: BorderRadius.circular(5.0),
            onPressed: () {
              Navigator.of(context).pop(Address(
                zipcode: _zipcodeController.text,
                address1: _buildingController.text,
                address2: _streetController.text,
                city: _cityController.text,
                state: _selectedState!.description,
                stateCode: _selectedState!.code,
                country: _selectedCountry?.description,
                countryCode: _selectedCountry?.code,
              ));
            },
          ),
        )
      ],
    );
  }
}

typedef OnPickImageCallback = void Function(
    double? maxWidth, double? maxHeight, int? quality);

class BusinessLogo extends StatefulWidget {
  const BusinessLogo({Key? key}) : super(key: key);

  @override
  State<BusinessLogo> createState() => _BusinessLogoState();
}

class _BusinessLogoState extends State<BusinessLogo> {
  final ImagePicker _picker = ImagePicker();
  final TextEditingController maxWidthController = TextEditingController();
  final TextEditingController maxHeightController = TextEditingController();
  final TextEditingController qualityController = TextEditingController();
  File? _imagePath;

  Future<void> _onImageButtonPressed(ImageSource source) async {
    try {
      final XFile? pickedFile = await _picker.pickImage(
          source: source, maxWidth: 500, maxHeight: 500);
      if (pickedFile != null) {
        setState(() {
          _imagePath = File(pickedFile.path);
          BlocProvider.of<BusinessBloc>(context)
              .add(OnChangePhoto(_imagePath!));
        });
      }
    } catch (e) {
      // setState(() {
      //   _pickImageError = e;
      // });
    }
  }

  ImageProvider _getImage(RetailLocationEntity? state) {
    if (_imagePath != null) {
      return FileImage(_imagePath!);
    } else {
      if (state != null && state.logo != null && state.logo!.isNotEmpty) {
        return NetworkImage(state.logo![0]);
      } else {
        return const NetworkImage(
            'https://images.unsplash.com/photo-1541569863345-f97c6484a917?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=3570&q=80');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _onImageButtonPressed(
          ImageSource.gallery,
        );
      },
      child: BlocBuilder<BusinessBloc, BusinessState>(
        builder: (context, state) {
          return Stack(
            children: [
              Hero(
                tag: "business-logo",
                child: CircleAvatar(
                  backgroundImage: _getImage(state.entity),
                  maxRadius: 60,
                  child: const Text(
                    "",
                  ),
                ),
              ),
              if (state.status == BusinessStatus.uploadingImage)
                const Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: CircularProgressIndicator(),
                )
            ],
          );
        },
      ),
    );
  }
}
