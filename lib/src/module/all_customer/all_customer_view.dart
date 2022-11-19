import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../config/route_config.dart';
import '../../config/theme_settings.dart';
import '../../entity/pos/contact_entity.dart';
import '../../widgets/cloud_sync_widget.dart';
import '../../widgets/my_loader.dart';
import 'bloc/all_customer_bloc.dart';

class WidgetNoCustomer extends StatelessWidget {
  const WidgetNoCustomer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(Icons.person_pin_outlined, size: 100, color: AppColor.iconColor),
            Text("Create new customer to add it to the sale.", style: TextStyle(color: AppColor.iconColor, fontStyle: FontStyle.italic)),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}

class AllCustomerView extends StatelessWidget {
  const AllCustomerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllCustomerBloc, AllCustomerState>(
      builder: (context, state) {
        if (state.status == AllCustomerStatus.loading) {
          return const MyLoader(color: AppColor.color6,);
        }
        return RefreshIndicator(
          onRefresh: () async {
            BlocProvider.of<AllCustomerBloc>(context).add(LoadAllCustomer());
          },
          child: state.customers.isEmpty ? const WidgetNoCustomer() : ListView.builder(
              itemCount: state.customers.length,
              itemBuilder: (ctx, idx) {
                return CustomerViewCard(contact: state.customers[idx]);
              }),
        );
      },
    );
  }
}

class CustomerViewCard extends StatelessWidget {
  final ContactEntity contact;
  const CustomerViewCard({Key? key, required this.contact}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed(RouteConfig.customerDetailScreen, arguments: contact.contactId);
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${contact.firstName} ${contact.lastName}',
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  if (contact.phoneNumber != null) Text('${contact.phoneNumber}'),
                  if (contact.email != null) Text('${contact.email}'),
                  if (contact.billingAddress != null )
                  Text(
                      '${contact.billingAddress}'),
                ],
              ),
              CloudSyncIcon(syncState: contact.syncState ?? 0),
            ],
          ),
        ),
      ),
    );
  }
}
