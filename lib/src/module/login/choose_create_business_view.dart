import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../config/theme_settings.dart';
import '../../model/api/api.dart';
import '../../widgets/app_logo.dart';
import '../../widgets/appbar_leading.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/my_loader.dart';
import '../authentication/bloc/authentication_bloc.dart';
import '../business/business_view.dart';
import 'login_design.dart';

class ChooseCreateBusinessView extends StatelessWidget with LoginThemeConfig {
  const ChooseCreateBusinessView({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(
        builder: (_) => const ChooseCreateBusinessView());
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
        bottom: false,
        child: Scaffold(
          backgroundColor: AppColor.background,
          body: Stack(
            children: [
              if (Platform.isIOS || Platform.isAndroid)
                const Positioned(
                  child: ChooseCreateBusinessForm(),
                ),
              if (Platform.isMacOS || Platform.isWindows || Platform.isLinux)
                Positioned(
                  child: Align(
                    child: SizedBox(
                      height: height,
                      width: width,
                      child: const ChooseCreateBusinessForm(),
                    ),
                  ),
                ),
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

class ChooseCreateBusinessForm extends StatefulWidget {
  const ChooseCreateBusinessForm({Key? key}) : super(key: key);

  @override
  State<ChooseCreateBusinessForm> createState() =>
      _ChooseCreateBusinessFormState();
}

class _ChooseCreateBusinessFormState extends State<ChooseCreateBusinessForm> with LoginThemeConfig {
  String? _selectedBusiness;
  UserBusiness? _selectedBusinessData;

  Widget _buildBusinessList(UserBusiness business) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: AppColor.background.withOpacity(0.8),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Radio<String>(
                value: business.storeId!,
                groupValue: _selectedBusiness,
                onChanged: (val) {
                  setState(() {
                    _selectedBusiness = val;
                    _selectedBusinessData = business;
                  });
                }),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                business.storeName ?? business.storeId ?? "N/A",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation,
      margin: const EdgeInsets.all(0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),
      child: BlocConsumer<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {
          // if (state.deviceList.isEmpty) {
          //   BlocProvider.of<LoginBloc>(context)
          //       .add(RemoveDevice(_selectedDeviceIds.toList()));
          // }
        },
        builder: (context, state) {
          return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: AppLogo(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Text(
                        'Check your existing business',
                        style: TextStyle(
                            fontSize: 18,
                            letterSpacing: 1.2,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Text(
                        "Choose Business you want to continue with.",
                        style: TextStyle(
                            color: AppColor.color5, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Opacity(
                          opacity: 0.3,
                          child: Center(
                            child: SvgPicture.asset(
                              "assets/image/undraw_web_shopping_re_owap.svg",
                              alignment: Alignment.center,
                              height: 200,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: ListView.builder(
                          itemCount: state.userBusinesses.length + 1,
                          itemBuilder: (context, index) {
                            if (index == state.userBusinesses.length) {
                              return const NewBusinessButton();
                            }
                            return _buildBusinessList(state.userBusinesses[index]);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0, top: 8.0),
                  child: Row(children: [
                    if (state.status ==
                        AuthenticationStatus.chooseBusinessLoading)
                      const Expanded(
                          child: MyLoader(
                        color: AppColor.primary,
                      )),
                    if (state.status !=
                        AuthenticationStatus.chooseBusinessLoading)
                      Expanded(
                        child: AcceptButton(
                          label: "Continue",
                          onPressed: _selectedBusiness != null
                              ? () {
                                  BlocProvider.of<AuthenticationBloc>(context)
                                      .add(ChangeBusinessAccount(
                                          _selectedBusinessData!.storeId!));
                                }
                              : null,
                        ),
                      )
                  ]),
                ),
                const SizedBox(
                  height: 10,
                ),
              ]);
        },
      ),
    );
  }
}

class NewBusinessButton extends StatelessWidget {
  const NewBusinessButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(BusinessView.route());
      },
      child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColor.background.withOpacity(0.8),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
              child: Column(
            children: const [
              Icon(Icons.add_business),
              Text("Add New Business")
            ],
          ))),
    );
  }
}
