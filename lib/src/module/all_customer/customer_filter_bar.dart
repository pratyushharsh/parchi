import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../config/theme_settings.dart';
import 'bloc/all_customer_bloc.dart';

class CustomerFilterBar extends StatelessWidget {
  const CustomerFilterBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 28,
      child: ListView(
        scrollDirection: Axis.horizontal,
        primary: true,
        children: const [
          CustomerSortChip()
        ],
      ),
    );
  }
}

class CustomerSortChip extends StatelessWidget {
  const CustomerSortChip({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllCustomerBloc, AllCustomerState>(
      builder: (context, state) {
        return PopupMenuButton<CustomerFilterSortBy>(
          position: PopupMenuPosition.under,
          offset: const Offset(0, 10),
          onSelected: (CustomerFilterSortBy sortBy) {
            context.read<AllCustomerBloc>().add(SortCustomerFilter(sortBy));
          },
          itemBuilder: (context) => CustomerFilterSortBy.values
              .map(
                (e) => PopupMenuItem<CustomerFilterSortBy>(
              height: 30,
              value: e,
              child: Row(
                children: [
                  Container(
                    width: 10,
                    height: 10,
                    decoration: const BoxDecoration(
                      color: Colors.black87,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    e.value,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          )
              .toList(),
          child: CustomerSortByCriteria(
              sortBy: state.filter.sortBy
          ),
        );
      },
    );
  }
}

class CustomerSortByCriteria extends StatelessWidget {
  final CustomerFilterSortBy sortBy;
  const CustomerSortByCriteria({Key? key, required this.sortBy}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color color = AppColor.primary;
    return Container(
      height: 10,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          color: color,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(Icons.sort_sharp, size: 14,),
          const SizedBox(
            width: 10,
          ),
          Text(
            sortBy.value,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}