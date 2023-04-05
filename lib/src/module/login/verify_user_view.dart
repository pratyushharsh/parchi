import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';

import '../../config/theme_settings.dart';
import '../../widgets/app_logo.dart';
import '../../widgets/appbar_leading.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/my_loader.dart';
import 'bloc/login_bloc.dart';
import 'login_design.dart';

class VerifyUserView extends StatelessWidget with LoginThemeConfig {
  const VerifyUserView({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const VerifyUserView());
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    if (Platform.isMacOS || Platform.isWindows || Platform.isLinux) {
      width = min(MediaQuery.of(context).size.width, 600);
      height = min(MediaQuery.of(context).size.height, 600);
    }

    return Container(
      color: backgroundColor,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColor.background,
          body: Stack(
            fit: StackFit.expand,
            children: [
              if (Platform.isIOS || Platform.isAndroid)
                const Positioned(
                  child: VerifyOtpForm(),
                ),
              if (Platform.isMacOS || Platform.isWindows || Platform.isLinux)
                Positioned(
                  child: Align(
                    child: SizedBox(
                      height: height,
                      width: width,
                      child: const VerifyOtpForm(),
                    ),
                  ),
                ),
              if (Platform.isIOS || Platform.isAndroid)
                Positioned(
                  top: 20,
                  left: 16,
                  child: AppBarLeading(
                    icon: Icons.arrow_back,
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}

class VerifyOtpForm extends StatefulWidget {
  const VerifyOtpForm({Key? key}) : super(key: key);

  @override
  State<VerifyOtpForm> createState() => _VerifyOtpFormState();
}

class _VerifyOtpFormState extends State<VerifyOtpForm> with LoginThemeConfig {
  OtpFieldController otpController = OtpFieldController();

  @override
  void initState() {
    super.initState();
    otpController = OtpFieldController();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation,
      margin: const EdgeInsets.all(0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: AppLogo(),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Please check your ${state.loginType}.',
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        "We've sent a code to ${state.validUserName}",
                        style: const TextStyle(
                            color: AppColor.color5, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: OTPTextField(
                    controller: otpController,
                    length: 6,
                    spaceBetween: 15,
                    contentPadding:
                        const EdgeInsets.only(left: 0, right: 0, top: 8),
                    textFieldAlignment: MainAxisAlignment.start,
                    width: 800,
                    fieldStyle: FieldStyle.box,
                    otpFieldStyle: OtpFieldStyle(
                      backgroundColor: AppColor.background,
                      borderColor: AppColor.primary,
                      focusBorderColor: AppColor.color5,
                      disabledBorderColor: AppColor.color5,
                      enabledBorderColor: AppColor.color5,
                      errorBorderColor: AppColor.color5,
                    ),
                    fieldWidth: 45,
                    inputFormatter: [
                      FilteringTextInputFormatter.allow(RegExp(r'\d')),
                    ],
                    outlineBorderRadius: 4,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                    onChanged: (pin) {
                      BlocProvider.of<LoginBloc>(context).add(OnOtpChange(pin));
                    },
                    onCompleted: (pin) {},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Didn't receive the code? "),
                      InkWell(
                        onTap: () {},
                        child: const Text(
                          "Click to resend",
                          style: TextStyle(
                              color: AppColor.primary,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
                AnimatedContainer(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  duration: const Duration(milliseconds: 300),
                  child: state.status != LoginStatus.verifyOtpLoading
                      ? Row(
                          children: [
                            Expanded(
                                child: RejectButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              label: 'Cancel',
                            )),
                            const SizedBox(
                              width: 16,
                            ),
                            Expanded(
                              key: const Key('verifyOtpButton'),
                                child: AcceptButton(
                              onPressed: state.validOtp
                                  ? () {
                                      BlocProvider.of<LoginBloc>(context)
                                          .add(VerifyUserOtp(state.otp));
                                    }
                                  : null,
                              label: 'Verify',
                            ))
                          ],
                        )
                      : const Center(
                          child: MyLoader(
                            color: AppColor.primary,
                          ),
                        ),
                ),
                Center(
                  heightFactor: 1.8,
                  child: SvgPicture.asset(
                    "assets/image/undraw_two_factor_authentication_namy.svg",
                    alignment: Alignment.center,
                    height: 150,
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
