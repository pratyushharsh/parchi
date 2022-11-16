import 'dart:io';
import 'dart:math';
import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../config/theme_settings.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/my_loader.dart';
import 'bloc/login_bloc.dart';


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
                    child: Container(
                      constraints: BoxConstraints(
                        maxWidth: min(MediaQuery.of(context).size.width, 600),
                        maxHeight: min(MediaQuery.of(context).size.height, 600),
                      ),
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

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late TextEditingController _phoneController;
  late String phoneNumber;

  @override
  void initState() {
    super.initState();
    _phoneController = TextEditingController();
    phoneNumber = '';
  }

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return Center(
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    const Text(
                      'loginHeader',
                      style: TextStyle(
                          fontSize: 30,
                          letterSpacing: 1.4,
                          fontWeight: FontWeight.bold),
                    ).tr(),
                    const SizedBox(
                      height: 25,
                    ),
                    const Text(
                      "loginHeaderDescription",
                      style: TextStyle(
                          color: AppColor.color5, fontWeight: FontWeight.w600),
                    ).tr(),
                    const SizedBox(
                      height: 50,
                    ),
                    TextField(
                      style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 35,
                          letterSpacing: 1.4),
                      maxLength: 10,
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "9999900000",
                        prefixIcon: Padding(
                          padding: EdgeInsets.all(4),
                          // @TODO Dynamically change the country code
                          child: Text(
                            '+91 ',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 35,
                                letterSpacing: 1.4),
                          ),
                        ),
                        hintStyle: TextStyle(color: AppColor.subtitleColorPrimary),
                      ),
                      onChanged: (val) {
                        setState(() {
                          phoneNumber = val;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 250,
                    ),
                    Row(children: [
                      if (state.status == LoginStatus.loadingLogin)
                        const Expanded(
                            child: MyLoader(
                          color: AppColor.primary,
                        )),
                      if (state.status != LoginStatus.loadingLogin)
                        Expanded(
                          child: AcceptButton(
                            label: "Sign In",
                            onPressed: phoneNumber.length == 10
                                ? () {
                                    // FocusScope.of(context).unfocus();
                                    BlocProvider.of<LoginBloc>(context)
                                        .add(LoginUserWithPhone("+91$phoneNumber"));
                                  }
                                : null,
                          ),
                        )
                    ]),
                    const SizedBox(
                      height: 30,
                    ),
                    Align(
                        alignment: Alignment.center,
                        child: const Text(
                          "termsOfService",
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              decoration: TextDecoration.underline,
                              color: AppColor.color5),
                        ).tr())
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
