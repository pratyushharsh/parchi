import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

import '../../config/theme_settings.dart';
import '../../widgets/search_bar.dart';
import '../all_customer/all_customer_view.dart';
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
    return Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Container(
            color: AppColor.primary,
            height: 30,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
            child: Row(
              children: const [
                Text("Customer", style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
        ),
        const Positioned(
          top: 35,
          left: 10,
          right: 10,
          child: SearchBar(label: "clients", hintText: "Search by Name, Phone Number",),
        ),
        const Positioned(
          top: 80,
          bottom: 0,
          left: 10,
          right: 10,
          child: AllCustomerView(),
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
