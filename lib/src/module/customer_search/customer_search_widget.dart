import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../entity/pos/contact_entity.dart';
import '../create_new_receipt/bloc/create_new_receipt_bloc.dart';
import 'bloc/customer_search_bloc.dart';
import 'customer_search_desktop.dart';
import 'customer_search_mobile.dart';

class CustomerSearch extends StatelessWidget {
  const CustomerSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (ctx) => CustomerSearchBloc(
        contactDb: RepositoryProvider.of(ctx),
      ),
      child: (Platform.isMacOS || Platform.isWindows) ? const CustomerSearchDesktop() : const CustomerSearchMobile(),
    );
  }
}

class CustomerSearchList extends StatelessWidget {
  const CustomerSearchList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustomerSearchBloc, CustomerSearchState>(
      builder: (context, state) {
        return Column(
          children: [
            ...state.customerSuggestion
                .map((e) => InkWell(
              onTap: () {
                Navigator.of(context).pop(OnCustomerSelect(e));
              },
              child: CustomerSearchEntity(contactEntity: e,),
            ))
                .toList(),
            if (state.phoneBookSuggestion.isNotEmpty)
              const Divider(
                height: 0,
              ),
            ...state.phoneBookSuggestion
                .map((e) => InkWell(
              onTap: () {
                Navigator.of(context).pop(OnCustomerSelect(e));
              },
              child: CustomerSearchEntity(
                contactEntity: e,
              ),
            ))
                .toList(),
          ],
        );
      },
    );
  }
}

class CustomerSearchEntity extends StatelessWidget {
  final ContactEntity contactEntity;
  const CustomerSearchEntity({Key? key, required this.contactEntity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 6.0),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey,
            width: 0.2,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(contactEntity.firstName),
              if (contactEntity.phoneNumber != null)
                Text(contactEntity.phoneNumber!),
            ]
          ),
          const Icon(
            Icons.phone,
            size: 15,
          )
        ],
      ),
    );
  }
}
