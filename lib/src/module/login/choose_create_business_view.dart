import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../config/theme_settings.dart';
import '../../model/api/api.dart';
import '../../widgets/appbar_leading.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/my_loader.dart';
import '../authentication/bloc/authentication_bloc.dart';
import '../business/business_view.dart';

class ChooseCreateBusinessView extends StatelessWidget {
  const ChooseCreateBusinessView({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(
        builder: (_) => const ChooseCreateBusinessView());
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
                      maxWidth:
                          min(MediaQuery.of(context).size.width, 600),
                      maxHeight:
                          min(MediaQuery.of(context).size.height, 600),
                    ),
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
  State<ChooseCreateBusinessForm> createState() => _ChooseCreateBusinessFormState();
}

class _ChooseCreateBusinessFormState extends State<ChooseCreateBusinessForm> {
  String? _selectedBusiness;
  UserBusiness? _selectedBusinessData;

  Widget _buildBusinessList(UserBusiness business) {
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
            Radio<String>(value: business.storeId!, groupValue: _selectedBusiness, onChanged: (val) {
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
      child: BlocConsumer<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {
          // if (state.deviceList.isEmpty) {
          //   BlocProvider.of<LoginBloc>(context)
          //       .add(RemoveDevice(_selectedDeviceIds.toList()));
          // }
        },
        builder: (context, state) {
          return Container(
            padding: const EdgeInsets.all(20),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  const Text(
                    'Check your existing business',
                    style: TextStyle(
                        fontSize: 30,
                        letterSpacing: 1.4,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    "  Choose Business",
                    style: TextStyle(
                        color: AppColor.color5, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
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
                  Row(children: [
                    if (state.status == AuthenticationStatus.chooseBusinessLoading)
                      const Expanded(child: MyLoader(color: AppColor.primary,)),
                    if (state.status != AuthenticationStatus.chooseBusinessLoading)
                      Expanded(
                        child: AcceptButton(
                          label: "Continue",
                          onPressed: _selectedBusiness != null ? () {
                            BlocProvider.of<AuthenticationBloc>(context).add(ChangeBusinessAccount(_selectedBusinessData!.storeId!));
                          } : null,
                        ),
                      )
                  ])
              ]
            ),
          );
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
          color: AppColor.background,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Column(
            children: const [
              Icon(Icons.add),
              Text("Add New Business")
            ],
          )
        )
      ),
    );
  }
}
