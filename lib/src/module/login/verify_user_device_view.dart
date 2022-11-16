import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../config/theme_settings.dart';
import '../../widgets/appbar_leading.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/my_loader.dart';
import 'bloc/login_bloc.dart';

class VerifyUserDeviceView extends StatelessWidget {
  const VerifyUserDeviceView({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(
        builder: (_) => const VerifyUserDeviceView());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.background,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColor.background,
          body: Stack(
            children: [
              Positioned(
                child: Align(
                  child: Container(
                    constraints: BoxConstraints(
                      maxWidth: min(MediaQuery.of(context).size.width, 600),
                      maxHeight: min(MediaQuery.of(context).size.height, 600),
                    ),
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

class _VerifyUserDeviceFormState extends State<VerifyUserDeviceForm> {
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
          color: AppColor.background,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Checkbox(
              value: _selectedDeviceIds.contains(device['device_key']),
              onChanged: device['device_key'] != currentDeviceKey ? (val) {
                setState(
                  () {
                    if (_selectedDeviceIds.contains(device['device_key'])) {
                      _selectedDeviceIds.remove(device['device_key']);
                    } else {
                      _selectedDeviceIds.add(device['device_key']);
                    }
                  },
                );
              } : null,
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
      child: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          // if (state.deviceList.isEmpty) {
          //   BlocProvider.of<LoginBloc>(context)
          //       .add(RemoveDevice(_selectedDeviceIds.toList()));
          // }
        },
        builder: (context, state) {
          return Container(
            padding: const EdgeInsets.all(20),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const SizedBox(height: 20),
              const Text(
                'Check your existing device',
                style: TextStyle(
                    fontSize: 30,
                    letterSpacing: 1.4,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                "  Select the device to remove from saved history.",
                style: TextStyle(
                    color: AppColor.color5, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: state.deviceList.length,
                  itemBuilder: (context, index) {
                    return _buildDeviceList(
                        state.deviceList[index], state.deviceKey);
                  },
                ),
              ),
              Row(children: [
                if (state.status == LoginStatus.verifyDeviceLoading)
                  const Expanded(
                      child: MyLoader(
                    color: AppColor.primary,
                  )),
                if (state.status != LoginStatus.verifyDeviceLoading)
                  Expanded(
                    child: AcceptButton(
                      label: "Continue",
                      onPressed: state.deviceList.where((e) => e['device_key'] != state.deviceKey).toList().length - _selectedDeviceIds.length < 3
                          ? () {
                              BlocProvider.of<LoginBloc>(context).add(
                                  RemoveDevice(_selectedDeviceIds.toList()));
                            }
                          : null,
                    ),
                  )
              ])
            ]),
          );
        },
      ),
    );
  }
}
