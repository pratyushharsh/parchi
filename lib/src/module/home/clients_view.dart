import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../config/theme_settings.dart';
import '../../widgets/search_bar.dart';
import '../all_customer/all_customer_view.dart';
import '../all_customer/bloc/all_customer_bloc.dart';
import '../all_customer/customer_filter_bar.dart';
import '../create_edit_customer/create_edit_customer_view.dart';

const List<String> sortOptions = [
  'Sort By Name',
  'Sort By Last',
  'Sort By Date'
];

class ClientsView extends StatelessWidget {
  const ClientsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AllCustomerBloc(
        customerRepository: RepositoryProvider.of(context),
      )..add(InitCustomerSearch()),
      child: const ClientsViewWidget(),
    );
  }
}

class ClientsViewWidget extends StatelessWidget {
  const ClientsViewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Column(
          children: [
            Container(
              color: AppColor.primary,
              height: 30,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
              child: Row(
                children: const [
                  Text("Customer", style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 8, right: 8),
              child: SearchBar(
                label: "clients",
                hintText: "Search by Name, Phone Number",
                onChanged: (val) {
                  BlocProvider.of<AllCustomerBloc>(context).add(
                    SearchCustomerFilter(val),
                  );
                },
                filterWidget: const CustomerFilterBar(),
              ),
            ),
            const Expanded(
              child: AllCustomerView(),
            )
          ],
        ),
        Positioned(
          bottom: 90,
          right: 20,
          child: OpenContainer(
            transitionType: ContainerTransitionType.fade,
            transitionDuration: const Duration(milliseconds: 300),
            openBuilder: (BuildContext context, VoidCallback _) {
              return const NewCustomerView();
            },
            closedElevation: 6.0,
            closedShape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(5)),
            ),
            closedBuilder: (BuildContext context, void Function() action) {
              return Container(
                height: 45,
                width: 45,
                color: AppColor.primary,
                child: const Center(
                  child: Icon(
                    Icons.person_add_alt_1,
                    color: AppColor.iconColor,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
