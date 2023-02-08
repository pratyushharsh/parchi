import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../config/route_config.dart';
import '../../config/theme_settings.dart';
import '../../widgets/app_logo.dart';
import '../../widgets/store_user_widget.dart';
import '../authentication/bloc/authentication_bloc.dart';
import '../customer_search/customer_search_widget.dart';
import 'bloc/dashboard_bloc.dart';
import 'clients_view.dart';

typedef OnChangeTab = void Function(int index);

class ReceiptView extends StatelessWidget {
  final OnChangeTab? onChangeTab;

  const ReceiptView({Key? key, this.onChangeTab}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const StoreUserWidget(),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
          child: Column(
            children: [
              const AppLogoPng(),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                      child: DashboardButton(
                        color: Colors.blue,
                        label: "_sale",
                        icon: const Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: FaIcon(
                            FontAwesomeIcons.store,
                            size: 35,
                            color: Colors.blue,
                          ),
                        ),
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(RouteConfig.createReceiptScreen);
                        },
                      )),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: DashboardButton(
                        color: Colors.redAccent,
                        label: "_return",
                        icon: const Icon(
                          Icons.assignment_return,
                          size: 45,
                          color: Colors.redAccent,
                        ),
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(RouteConfig.createReturnReceiptScreen);
                        },
                      )),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                      child: DashboardButton(
                        color: Colors.orangeAccent,
                        label: "_itemSearch",
                        onTap: () {
                          BlocProvider.of<DashboardBloc>(context)
                              .add(DashboardChangeTabEvent(index: 3));
                        },
                        icon: const Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: FaIcon(
                            FontAwesomeIcons.boxesStacked,
                            size: 35,
                            color: Colors.orangeAccent,
                          ),
                        ),
                      )),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: DashboardButton(
                        color: Colors.purple,
                        label: "_customerSearch",
                        onTap: () {
                          BlocProvider.of<DashboardBloc>(context)
                              .add(DashboardChangeTabEvent(index: 1));
                        },
                        icon: const Icon(
                          Icons.people_outline,
                          size: 45,
                          color: Colors.purple,
                        ),
                      )),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class DashboardButton extends StatelessWidget {
  final String label;
  final Color color;
  final Widget? icon;
  final GestureTapCallback? onTap;

  const DashboardButton({Key? key,
    required this.label,
    required this.color,
    this.icon,
    this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 120,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: color)),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (icon != null)
                  Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: icon!,
                  ),
                Text(
                  label,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: color,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    letterSpacing: 2,
                    fontStyle: FontStyle.italic,
                  ),
                ).tr(),
                const SizedBox(
                  height: 5,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
