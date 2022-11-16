import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../config/theme_settings.dart';
import '../../widgets/appbar_leading.dart';
import '../../widgets/custom_text_field.dart';
import 'bloc/receipt_setting_bloc.dart';
import 'mock_receipt_view.dart';

class ReceiptSettingView extends StatelessWidget {
  const ReceiptSettingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ReceiptSettingBloc(
        settingsRepo: RepositoryProvider.of(context),
        authBloc: BlocProvider.of(context),
      )..add(OnInitReceiptSettingEvent()),
      child: const ReceiptSettingForm(),
    );
  }
}

class ReceiptSettingForm extends StatelessWidget {
  const ReceiptSettingForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          fit: StackFit.expand,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: SingleChildScrollView(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    child: Column(
                      children: const [
                        SizedBox(
                          height: 80,
                        ),
                        ReceiptSettingInput()
                      ],
                    ),
                  ),
                ),
                const Expanded(flex: 2, child: MockReceiptView())
              ],
            ),
            Positioned(
              top: 20,
              left: 16,
              child: AppBarLeading(
                  heading: "Receipt Setting",
                  icon: Icons.arrow_back,
                  onTap: () {
                    Navigator.of(context).pop();
                  }),
            ),
            Positioned(
              top: 20,
              right: 16,
              child: ElevatedButton(
                onPressed: () {
                  BlocProvider.of<ReceiptSettingBloc>(context)
                      .add(OnSaveReceiptEvent());
                },
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: AppColor.color8,
                  padding:
                      const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0)),
                ),
                child: const Text(
                  "Save",
                  style: TextStyle(color: AppColor.primary),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ReceiptSettingInput extends StatefulWidget {
  const ReceiptSettingInput({Key? key}) : super(key: key);

  @override
  State<ReceiptSettingInput> createState() => _ReceiptSettingInputState();
}

class _ReceiptSettingInputState extends State<ReceiptSettingInput> {
  late TextEditingController _storePhoneNumber;
  late TextEditingController _storeTagLine;
  late TextEditingController _storeAddress;
  late TextEditingController _storeFooterTitle;
  late TextEditingController _storeFooterSubTitle;

  @override
  void initState() {
    super.initState();
    _storePhoneNumber = TextEditingController();
    _storeTagLine = TextEditingController();
    _storeAddress = TextEditingController();
    _storeFooterTitle = TextEditingController();
    _storeFooterSubTitle = TextEditingController();
  }

  @override
  void dispose() {
    _storePhoneNumber.dispose();
    _storeTagLine.dispose();
    _storeAddress.dispose();
    _storeFooterTitle.dispose();
    _storeFooterSubTitle.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ReceiptSettingBloc, ReceiptSettingState>(
      listener: (context, state) {
        if (ReceiptSettingStatus.initLoad == state.status) {
          _storePhoneNumber.text = state.storeNumber;
          _storeTagLine.text = state.tagLine;
          _storeAddress.text = state.storeAddress;
          _storeFooterTitle.text = state.footerTitle;
          _storeFooterSubTitle.text = state.footerSubtitle;
        }
      },
      builder: (context, state) {
        return Column(
          children: [
            CustomTextField(
              controller: _storePhoneNumber,
              label: "Store Phone Number",
              textAlign: TextAlign.start,
              textInputType: TextInputType.phone,
              onValueChange: (val) {
                BlocProvider.of<ReceiptSettingBloc>(context)
                    .add(OnStoreNumberChange(value: val));
              },
            ),
            CustomTextField(
              controller: _storeTagLine,
              label: "Tagline",
              textAlign: TextAlign.center,
              onValueChange: (val) {
                BlocProvider.of<ReceiptSettingBloc>(context)
                    .add(OnTaglineChange(value: val));
              },
            ),
            CustomTextField(
              controller: _storeAddress,
              label: "Store Address",
              textAlign: TextAlign.center,
              style: const TextStyle(),
              minLines: 6,
              maxLines: 10,
              onValueChange: (val) {
                BlocProvider.of<ReceiptSettingBloc>(context)
                    .add(OnStoreAddressChange(value: val));
              },
            ),
            CustomTextField(
              controller: _storeFooterTitle,
              label: "Footer title",
              textAlign: TextAlign.center,
              onValueChange: (val) {
                BlocProvider.of<ReceiptSettingBloc>(context)
                    .add(OnStoreFooterTitleChange(value: val));
              },
            ),
            CustomTextField(
              controller: _storeFooterSubTitle,
              label: "Footer Subtitle",
              minLines: 5,
              maxLines: 10,
              textAlign: TextAlign.center,
              onValueChange: (val) {
                BlocProvider.of<ReceiptSettingBloc>(context)
                    .add(OnStoreFooterSubTitleChange(value: val));
              },
            ),
          ],
        );
      },
    );
  }
}
