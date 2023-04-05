import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../config/theme_settings.dart';
import '../../widgets/app_logo.dart';
import '../../widgets/appbar_leading.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/my_loader.dart';
import 'bloc/login_bloc.dart';
import 'login_design.dart';

class VerifyUserDeviceView extends StatelessWidget with LoginThemeConfig {
  const VerifyUserDeviceView({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(
        builder: (_) => const VerifyUserDeviceView());
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
                  child: VerifyUserDeviceForm(),
                ),
              if (Platform.isMacOS || Platform.isWindows || Platform.isLinux)
              Positioned(
                child: Align(
                  child: SizedBox(
                    height: height,
                    width: width,
                    child: const VerifyUserDeviceForm(),
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

class VerifyUserDeviceForm extends StatefulWidget {
  const VerifyUserDeviceForm({Key? key}) : super(key: key);

  @override
  State<VerifyUserDeviceForm> createState() => _VerifyUserDeviceFormState();
}

class _VerifyUserDeviceFormState extends State<VerifyUserDeviceForm> with LoginThemeConfig {
  Set<String> _selectedDeviceIds = {};

  @override
  initState() {
    super.initState();
    _selectedDeviceIds = {};
  }

  @override
  dispose() {
    _selectedDeviceIds = {};
    super.dispose();
  }

  Widget _buildDeviceList(device, String? currentDeviceKey) {
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
            Checkbox(
              value: _selectedDeviceIds.contains(device['device_key']),
              onChanged: device['device_key'] != currentDeviceKey
                  ? (val) {
                      setState(
                        () {
                          if (_selectedDeviceIds
                              .contains(device['device_key'])) {
                            _selectedDeviceIds.remove(device['device_key']);
                          } else {
                            _selectedDeviceIds.add(device['device_key']);
                          }
                        },
                      );
                    }
                  : null,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    device['device_name'] ?? '',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  if (device['device_key'] == currentDeviceKey)
                    const Text(
                      'This device',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: AppColor.primary,
                      ),
                    ),
                ],
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
      child: BlocConsumer<LoginBloc, LoginState>(
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
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Check your existing device',
                      style: TextStyle(
                          fontSize: 18,
                          letterSpacing: 1.1,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Select the device to remove from saved history.",
                      style: TextStyle(
                          color: AppColor.color5, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Opacity(
                        opacity: 0.3,
                        child: Center(
                          child: SvgPicture.asset(
                            "assets/image/undraw_secure_login_pdn4.svg",
                            alignment: Alignment.center,
                            height: 200,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: ListView.builder(
                        itemCount: state.deviceList.length,
                        itemBuilder: (context, index) {
                          return _buildDeviceList(
                              state.deviceList[index], state.deviceKey);
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 8, bottom: 16),
                child: Row(
                  children: [
                    if (state.status == LoginStatus.verifyDeviceLoading)
                      const Expanded(
                          child: MyLoader(
                        color: AppColor.primary,
                      )),
                    if (state.status != LoginStatus.verifyDeviceLoading)
                      Expanded(
                        key: const Key('removeDeviceButton'),
                        child: AcceptButton(
                          label: "Continue",
                          onPressed: state.deviceList
                                          .where((e) =>
                                              e['device_key'] !=
                                              state.deviceKey)
                                          .toList()
                                          .length -
                                      _selectedDeviceIds.length <
                                  6
                              ? () {
                                  BlocProvider.of<LoginBloc>(context).add(
                                      RemoveDevice(
                                          _selectedDeviceIds.toList()));
                                }
                              : null,
                        ),
                      )
                  ],
                ),
              ),
              const SizedBox(height: 10,)
            ],
          );
        },
      ),
    );
  }
}
