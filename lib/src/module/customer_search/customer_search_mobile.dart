import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../config/theme_settings.dart';
import '../../widgets/appbar_leading.dart';
import '../../widgets/custom_text_field.dart';
import 'bloc/customer_search_bloc.dart';
import 'customer_search_widget.dart';

class CustomerSearchMobile extends StatelessWidget {
  const CustomerSearchMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.primary,
      child: SafeArea(
        bottom: false,
        child: Scaffold(
            body: Stack(children: [
          Positioned(
            top: 20,
            left: 16,
            child: AppBarLeading(
              heading: "Search Customer",
              icon: Icons.arrow_back,
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          Positioned(
              top: 80,
              left: 16,
              right: 16,
              bottom: 0,
              child: Column(children: [
                CustomTextField(
                  label: "Customer Detail",
                  hint: "Customer name, Phone number, Email",
                  onValueChange: (value) {
                    BlocProvider.of<CustomerSearchBloc>(context)
                        .add(OnCustomerNameChange(name: value));
                  },
                ),
                const Expanded(
                  child: SingleChildScrollView(
                    child: CustomerSearchList(),
                  ),
                ),
              ]))
        ])),
      ),
    );
  }
}
