import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/custom_text_field.dart';
import 'bloc/customer_search_bloc.dart';
import 'customer_search_widget.dart';

class CustomerSearchDesktop extends StatelessWidget {
  const CustomerSearchDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        const Text(
          "Search Customer",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        const Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: CustomTextField(
            label: "Customer Detail",
            onValueChange: (value) {
              BlocProvider.of<CustomerSearchBloc>(context)
                  .add(OnCustomerNameChange(name: value));
            },
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: CustomerSearchList(),
        )
      ],
    );
  }
}
