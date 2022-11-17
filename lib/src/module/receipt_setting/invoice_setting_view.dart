import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../config/theme_settings.dart';
import '../../widgets/appbar_leading.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/invoice/widget.dart';
import '../receipt_display/template/invoice_config.dart';
import 'bloc/invoice_setting_bloc.dart';
import 'mock_invoice_view.dart';

class InvoiceSettingView extends StatelessWidget {
  const InvoiceSettingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InvoiceSettingBloc(
        invoiceRepo: RepositoryProvider.of(context),
        authBloc: BlocProvider.of(context),
      )..add(OnInitialInvoiceSettingEvent()),
      child: const InvoiceSettingForm(),
    );
  }
}

class InvoiceSettingForm extends StatefulWidget {
  const InvoiceSettingForm({Key? key}) : super(key: key);

  @override
  State<InvoiceSettingForm> createState() => _InvoiceSettingFormState();
}

class _InvoiceSettingFormState extends State<InvoiceSettingForm> {
  bool _openSetting = false;

  bool _isMobileView() {
    return MediaQuery.of(context).size.width < 800;
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          fit: StackFit.expand,
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: (_isMobileView() && _openSetting) ? MediaQuery.of(context).size.height * 0.60 : 0,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (width > 800)
                    Expanded(
                      flex: 1,
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          SingleChildScrollView(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 16),
                            child: Column(
                              children: const [
                                SizedBox(
                                  height: 80,
                                ),
                                InvoiceSettingInput()
                              ],
                            ),
                          ),
                          Positioned(
                            bottom: 10,
                            left: 16,
                            right: 16,
                            child: AcceptButton(
                              label: 'Save',
                              onPressed: () {
                                BlocProvider.of<InvoiceSettingBloc>(context)
                                    .add(OnSaveInvoiceSettingEvent());
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  const Expanded(flex: 2, child: MockInvoiceView())
                ],
              ),
            ),
            Positioned(
              top: 20,
              left: 16,
              child: AppBarLeading(
                  heading: "Invoice Setting",
                  icon: Icons.arrow_back,
                  onTap: () {
                    Navigator.of(context).pop();
                  }),
            ),
            if (width <= 800)
              Positioned(
                top: 20,
                right: 16,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      _openSetting = !_openSetting;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColor.color8,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: 40,
                    width: 40,
                    child: Center(
                      child: FaIcon(
                        _openSetting ? FontAwesomeIcons.eyeSlash : FontAwesomeIcons.pen,
                        color: AppColor.primary,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ),
              if (width <= 800 && _openSetting)
              Positioned(
                top: MediaQuery.of(context).size.height * 0.35,
                right: 0,
                left: 0,
                bottom: 0,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  child: Card(
                    elevation: 10,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: AppColor.background,
                      ),
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          children: const [
                            SizedBox(
                              height: 80,
                            ),
                            InvoiceSettingInput()
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            if (width <= 800 && _openSetting)
            Positioned(
              bottom: 10,
              left: 16,
              right: 16,
              child: AcceptButton(
                label: 'Save',
                onPressed: () {
                  BlocProvider.of<InvoiceSettingBloc>(context)
                      .add(OnSaveInvoiceSettingEvent());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InvoiceSettingInput extends StatefulWidget {
  const InvoiceSettingInput({Key? key}) : super(key: key);

  @override
  State<InvoiceSettingInput> createState() => _InvoiceSettingInputState();
}

class _InvoiceSettingInputState extends State<InvoiceSettingInput> {
  late TextEditingController _termsConditionController;
  late TextEditingController _declarationController;

  @override
  void initState() {
    super.initState();
    _termsConditionController = TextEditingController();
    _declarationController = TextEditingController();
  }

  @override
  void dispose() {
    _termsConditionController.dispose();
    _declarationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InvoiceSettingBloc, InvoiceSettingState>(
      builder: (context, state) {
        if (InvoiceSettingStatus.preLoad == state.status) {
          _termsConditionController.text = state.termsAndCondition ?? '';
          _declarationController.text = state.declaration ?? '';
        }

        return Column(
          children: [
            const UploadViewImage(),
            MultiChoiceReportColumnConfigSelection(
              options: InvoiceConfigConstants.headerAdditionalFields
                  .where((e) => !state.headerFields.contains(e))
                  .toList(),
              selectedOptions: state.headerFields,
              onUpdateOption: (val) {
                BlocProvider.of<InvoiceSettingBloc>(context)
                    .add(OnReportFieldConfigUpdate(field: val, type: FieldType.header));
              },
              onSelect: (val) {
                context.read<InvoiceSettingBloc>().add(AddNewConfigField(field: val, type: FieldType.header));
              },
              onDeselect: (val) {
                context.read<InvoiceSettingBloc>().add(RemoveConfigField(field: val, type: FieldType.header));
              },
              label: "Add custom fields at store.",
            ),
            const SizedBox(
              height: 16,
            ),
            MultiChoiceReportColumnConfigSelection(
              options: InvoiceConfigConstants.billingAddressFields
                  .where((e) => !state.billingAddressFields.contains(e))
                  .toList(),
              selectedOptions: state.billingAddressFields,
              onUpdateOption: (val) {
                BlocProvider.of<InvoiceSettingBloc>(context)
                    .add(OnReportFieldConfigUpdate(field: val, type: FieldType.billingAddress));
              },
              onSelect: (val) {
                context.read<InvoiceSettingBloc>().add(AddNewConfigField(field: val, type: FieldType.billingAddress));
              },
              onDeselect: (val) {
                context.read<InvoiceSettingBloc>().add(RemoveConfigField(field: val, type: FieldType.billingAddress));
              },
              label: "Additional Fields At Billing Address",
            ),
            const SizedBox(
              height: 16,
            ),
            MultiChoiceReportColumnConfigSelection(
              options: InvoiceConfigConstants.shippingAddressFields
                  .where((e) => !state.shippingAddressFields.contains(e))
                  .toList(),
              selectedOptions: state.shippingAddressFields,
              onUpdateOption: (val) {
                BlocProvider.of<InvoiceSettingBloc>(context)
                    .add(OnReportFieldConfigUpdate(field: val, type: FieldType.shippingAddress));
              },
              onSelect: (val) {
                context.read<InvoiceSettingBloc>().add(AddNewConfigField(field: val, type: FieldType.shippingAddress));
              },
              onDeselect: (val) {
                context.read<InvoiceSettingBloc>().add(RemoveConfigField(field: val, type: FieldType.shippingAddress));
              },
              label: "Additional Fields At Shipping Address.",
            ),
            const SizedBox(
              height: 16,
            ),
            MultiChoiceReportColumnConfigSelection(
              options: InvoiceConfigConstants.columnConfig
                  .where((e) => !state.columns.contains(e))
                  .toList(),
              selectedOptions: state.columns,
              onUpdateOption: (val) {
                BlocProvider.of<InvoiceSettingBloc>(context)
                    .add(OnReportFieldConfigUpdate(field: val, type: FieldType.item));
              },
              onSelect: (val) {
                context.read<InvoiceSettingBloc>().add(AddNewConfigField(field: val, type: FieldType.item));
              },
              onDeselect: (val) {
                context.read<InvoiceSettingBloc>().add(RemoveConfigField(field: val, type: FieldType.item));
              },
              label: "Select Items Columns to display.",
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Checkbox(
                  value: state.showPaymentDetails,
                  activeColor: AppColor.primary,
                  onChanged: (val) {
                    context
                        .read<InvoiceSettingBloc>()
                        .add(ShowPaymentDetails(val!));
                  },
                ),
                const Text("Show Payment Details")
              ],
            ),
            if (state.showPaymentDetails)
            MultiChoiceReportColumnConfigSelection(
              options: InvoiceConfigConstants.paymentColumn
                  .where((e) => !state.paymentColumns.contains(e))
                  .toList(),
              selectedOptions: state.paymentColumns,
              onUpdateOption: (val) {
                BlocProvider.of<InvoiceSettingBloc>(context)
                    .add(OnReportFieldConfigUpdate(field: val, type: FieldType.payment));
              },
              onSelect: (val) {
                context.read<InvoiceSettingBloc>().add(AddNewConfigField(field: val, type: FieldType.payment));
              },
              onDeselect: (val) {
                context.read<InvoiceSettingBloc>().add(RemoveConfigField(field: val, type: FieldType.payment));
              },
              label: "Select Payment Columns to display.",
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Checkbox(
                    value: state.showTaxSummary,
                    activeColor: AppColor.primary,
                    onChanged: (val) {
                      context
                          .read<InvoiceSettingBloc>()
                          .add(ShowTaxSummary(val!));
                    }),
                const Text("Show Tax Summary")
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Checkbox(
                  value: state.showTermsAndCondition,
                  activeColor: AppColor.primary,
                  onChanged: (val) {
                    context
                        .read<InvoiceSettingBloc>()
                        .add(ShowTermsAnsCondition(val!));
                  },
                ),
                const Text("Display Terms And Condition.")
              ],
            ),
            if (state.showTermsAndCondition)
              CustomTextField(
                label: "Terms And Conditions",
                controller: _termsConditionController,
                textAlign: TextAlign.start,
                minLines: 10,
                maxLines: 20,
                onValueChange: (val) {
                  context
                      .read<InvoiceSettingBloc>()
                      .add(UpdateTermsAnsCondition(val));
                },
              ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Checkbox(
                  value: state.showDeclaration,
                  activeColor: AppColor.primary,
                  onChanged: (val) {
                    context
                        .read<InvoiceSettingBloc>()
                        .add(ShowDeclaration(val!));
                  },
                ),
                const Text("Display Declaration.")
              ],
            ),
            if (state.showDeclaration)
              CustomTextField(
                label: "Declaration",
                controller: _declarationController,
                textAlign: TextAlign.start,
                minLines: 5,
                maxLines: 10,
                onValueChange: (val) {
                  context
                      .read<InvoiceSettingBloc>()
                      .add(UpdateDeclaration(val));
                },
              ),
            const SizedBox(
              height: 200,
            ),
          ],
        );
      },
    );
  }
}

class UploadViewImage extends StatelessWidget {
  const UploadViewImage({Key? key}) : super(key: key);

  onUpload(BuildContext context) async {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(type: FileType.image, allowMultiple: false);
    if (result != null) {
      context
          .read<InvoiceSettingBloc>()
          .add(UploadLogoFromPlatform(result.files.single));
    } else {
      // User canceled the picker
      // print("User Cancelled");
    }
  }

  bool isValidImage(String? path) {
    if (path == null || path.isEmpty) return false;
    return path.length > 4;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InvoiceSettingBloc, InvoiceSettingState>(
      builder: (context, state) {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 8),
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
              color: AppColor.color8,
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: AppColor.color8)),
          child: InkWell(
            onTap: () => onUpload(context),
            child: isValidImage(state.logo)
                ? ImageFromFileOrNetwork(url: state.logo!)
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.add_a_photo,
                        color: AppColor.primary,
                        size: 40,
                      ),
                      Text(
                        "Upload Logo",
                        style: TextStyle(color: AppColor.primary),
                      ),
                    ],
                  ),
          ),
        );
      },
    );
  }
}

class ImageFromFileOrNetwork extends StatelessWidget {
  final String url;
  const ImageFromFileOrNetwork({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (url.startsWith('file://')) {
      return Image.file(File(url.replaceFirst('file://', '')));
    } else if (url.startsWith('http') || url.startsWith('https')) {
      return Image.network(url);
    }
    return Container();
  }
}
