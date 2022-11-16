import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../config/theme_settings.dart';
import '../../widgets/appbar_leading.dart';
import 'bloc/customer_detail_bloc.dart';


class CustomerDetailScreen extends StatelessWidget {
  final String userId;
  const CustomerDetailScreen({Key? key, required this.userId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: BlocProvider(
            create: (context) => CustomerDetailBloc(
                customerId: userId, customerRepository: RepositoryProvider.of(context))
              ..add(LoadCustomerPurchaseList()),
            child: Stack(
              fit: StackFit.expand,
              children: [
                Positioned(
                  top: 20,
                  left: 16,
                  child: AppBarLeading(
                    heading: "Customer Detail# $userId",
                    icon: Icons.arrow_back,
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
                Positioned(
                  top: 60,
                  left: 0,
                  right: 0,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height - 60,
                    child: const UserProfileDetail(),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class UserProfileDetail extends StatelessWidget {
  const UserProfileDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: const [
          TabBar(
            indicatorColor: AppColor.primary,
            unselectedLabelColor: AppColor.subtitleColorPrimary,
            labelColor: AppColor.primary,
            tabs: [
              Tab(icon: FaIcon(FontAwesomeIcons.list)),
              Tab(icon: FaIcon(FontAwesomeIcons.circleUser)),
            ],
          ),
          // Expanded(
          //   child: TabBarView(
          //     children: [
          //       CustomerPurchaseListDisplay(),
          //       Icon(Icons.directions_transit),
          //     ],
          //   ),
          // )
        ],
      ),
    );
  }
}


