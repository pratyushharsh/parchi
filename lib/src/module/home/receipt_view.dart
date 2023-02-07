import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../config/route_config.dart';
import '../../widgets/app_logo.dart';

class ReceiptView extends StatelessWidget {
  const ReceiptView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          const AppLogoPng(),
          const SizedBox(height: 20,),
          Row(
            children: [
              Expanded(
                  child: DashboardButton(
                color: Colors.blue,
                label: "SALE",
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
                label: "RETURN",
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
            children: const [
              Expanded(
                  child: DashboardButton(
                color: Colors.orangeAccent,
                label: "Item Search",
                icon: Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: FaIcon(
                    FontAwesomeIcons.boxesStacked,
                    size: 35,
                    color: Colors.orangeAccent,
                  ),
                ),
              )),
              SizedBox(
                width: 10,
              ),
              Expanded(
                  child: DashboardButton(
                color: Colors.purpleAccent,
                label: "Customer Search",
                icon: Icon(
                  Icons.people_outline,
                  size: 45,
                  color: Colors.purpleAccent,
                ),
              )),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}

class DashboardButton extends StatelessWidget {
  final String label;
  final Color color;
  final Widget? icon;
  final GestureTapCallback? onTap;
  const DashboardButton(
      {Key? key,
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
                  label.toUpperCase(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: color,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    letterSpacing: 2,
                  ),
                ),
                SizedBox(
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
