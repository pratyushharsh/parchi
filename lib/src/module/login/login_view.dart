import 'dart:io';
import 'dart:math';
import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../config/theme_settings.dart';
import '../../widgets/app_logo.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/my_loader.dart';
import 'bloc/login_bloc.dart';
import 'login_design.dart';
import 'phone_email_widget.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const LoginView());
  }

  // Widget _buildWidget() {
  //
  // }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    if (Platform.isMacOS || Platform.isWindows || Platform.isLinux) {
      width = min(MediaQuery.of(context).size.width, 600);
      height = min(MediaQuery.of(context).size.height, 600);
    }

    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Stack(
            fit: StackFit.expand,
            children: [
              Positioned.fill(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: SvgPicture.asset(
                    "assets/logo/logo_revert.svg",
                    alignment: Alignment.center,
                  ),
                ),
              ),
              Positioned.fill(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Container(
                    color: Colors.black.withOpacity(0.05),
                  ),
                ),
              ),
              if (Platform.isIOS || Platform.isAndroid)
                const Positioned(
                  child: LoginForm(),
                ),
              if (Platform.isMacOS || Platform.isWindows || Platform.isLinux)
                Positioned(
                  child: Align(
                    child: SizedBox(
                      height: height,
                      width: width,
                      child: const LoginForm(),
                    ),
                  ),
                ),
              // Positioned(
              //   top: 20,
              //   left: 16,
              //   child: AppBarLeading(
              //     icon: Icons.arrow_back,
              //     onTap: () {
              //       Navigator.of(context).pop();
              //     },
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}

class LoginForm extends StatelessWidget with LoginThemeConfig {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),
      elevation: elevation,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 25),
              child: AppLogo(),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: const Text(
                'What\'s your phone number or email?',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.normal),
              ).tr(),
            ),
            const Padding(
              key: Key("phoneOrEmailWidget"),
              padding: EdgeInsets.all(16.0),
              child: PhoneOrEmailWidget(),
            ),
            BlocBuilder<LoginBloc, LoginState>(
              builder: (context, state) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 200),
                    child: state.status == LoginStatus.loadingLogin
                        ? const Center(
                            child: MyLoader(
                              color: AppColor.primary,
                            ),
                          )
                        : Row(children: [
                            Expanded(
                              key: const Key("signInButton"),
                              child: AcceptButton(
                                label: "Sign In",
                                onPressed: (state.validation.isEmpty &&
                                        state.username.length > 3)
                                    ? () {
                                        context.read<LoginBloc>().add(
                                            LoginUserWithPhone(state.validUserName));
                                      }
                                    : null,
                              ),
                            )
                          ]),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    "termsOfService",
                    style: TextStyle(
                        height: 1.3, wordSpacing: 1.3, color: AppColor.color5),
                  ).tr()),
            ),
            Center(
              heightFactor: 1.8,
              child: SvgPicture.asset(
                "assets/image/undraw_authentication_re_svpt.svg",
                alignment: Alignment.center,
                height: 150,
              ),
            )
          ],
        ),
      ),
    );
  }
}
