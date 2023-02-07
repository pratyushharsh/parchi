import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../config/route_config.dart';
import '../../config/theme_settings.dart';
import '../../widgets/clipper/wave_clipper.dart';
import '../load_customer_contact/bloc/load_customer_contact_bloc.dart';
import 'bloc/dashboard_bloc.dart';
import 'clients_view.dart';
import 'dashboard_view.dart';
import 'items_view.dart';
import 'receipt_view.dart';
import 'settings_view.dart';

typedef _LetIndexPage = void Function(int value);

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const HomeScreen());
  }

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 2;

  final List<Widget> _tabs = const [
    DashboardView(),
    ClientsView(),
    ReceiptView(),
    ItemsView(),
    SettingsView()
  ];

  void changeIndex(int value) {
    setState(() {
      selectedIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DashboardBloc(),
      child: BlocListener<DashboardBloc, DashboardState>(
        listener: (context, state) {
          changeIndex(state.index);
        },
        child: Container(
          decoration: BoxDecoration(
            gradient: selectedIndex != 4
                ? const LinearGradient(colors: [
                    AppColor.primary,
                    AppColor.primary,
                    AppColor.background,
                    Colors.white,
                  ], begin: Alignment.topCenter, end: Alignment.bottomCenter)
                : const LinearGradient(colors: [
                    AppColor.background,
                    Colors.white,
                  ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
          ),
          child: SafeArea(
            child: Scaffold(
              backgroundColor: AppColor.background,
              body: Stack(
                fit: StackFit.expand,
                clipBehavior: Clip.none,
                children: [
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 250),
                    // transitionBuilder:
                    //     (Widget child, Animation<double> animation) =>
                    //         ScaleTransition(
                    //   scale: animation,
                    //   child: child,
                    // ),
                    child: _tabs[selectedIndex],
                  ),
                  Positioned(
                    bottom: 0,
                    child: MyBottomAppBar(
                      letIndexChange: changeIndex,
                      selectedIndex: selectedIndex,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MyBottomAppBar extends StatefulWidget {
  final _LetIndexPage letIndexChange;
  final int selectedIndex;
  const MyBottomAppBar(
      {Key? key, required this.letIndexChange, required this.selectedIndex})
      : super(key: key);

  @override
  State<MyBottomAppBar> createState() => _MyBottomAppBarState();
}

class _MyBottomAppBarState extends State<MyBottomAppBar> {
  bool _open = false;

  Widget _buildSwitcher() {
    if (_open) {
      return SaleOptions(onClose: _onCloseOptions);
    }
    return Container();
  }

  void _onCloseOptions() {
    setState(() {
      _open = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.spaceBetween;
    if (Platform.isMacOS || Platform.isWindows) {
      mainAxisAlignment = MainAxisAlignment.center;
    }

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Column(
          children: [
            const SizedBox(
              height: 150,
            ),
            Container(
              height: 30,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Colors.white,
                  Colors.white.withOpacity(0.0),
                ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
              ),
            ),
            Container(
              height: 60,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              padding:
                  const EdgeInsets.only(left: 16, right: 16, top: 0, bottom: 8),
              child: Row(
                mainAxisAlignment: mainAxisAlignment,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      widget.letIndexChange(0);
                      // setState(() {
                      //   _open = !_open;
                      // });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.receipt_long_rounded,
                            color: widget.selectedIndex == 0
                                ? AppColor.primary
                                : AppColor.iconColor,
                          ),
                          Text("_sale",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: widget.selectedIndex == 0
                                    ? AppColor.primary
                                    : AppColor.iconColor,
                              )).tr(),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      widget.letIndexChange(1);
                      setState(() {
                        _open = false;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.people_outline,
                            color: widget.selectedIndex == 1
                                ? AppColor.primary
                                : AppColor.iconColor,
                          ),
                          Text("_customer",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: widget.selectedIndex == 1
                                    ? AppColor.primary
                                    : AppColor.iconColor,
                              )).tr(),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      widget.letIndexChange(2);
                      setState(() {
                        _open = false;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.stacked_bar_chart_rounded,
                            color: widget.selectedIndex == 2
                                ? AppColor.primary
                                : AppColor.iconColor,
                          ),
                          Text(
                            "_home",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: widget.selectedIndex == 2
                                  ? AppColor.primary
                                  : AppColor.iconColor,
                            ),
                          ).tr(),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      widget.letIndexChange(3);
                      setState(() {
                        _open = false;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          FaIcon(
                            FontAwesomeIcons.boxesStacked,
                            color: widget.selectedIndex == 3
                                ? AppColor.primary
                                : AppColor.iconColor,
                            size: 18,
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          Text("_product",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: widget.selectedIndex == 3
                                    ? AppColor.primary
                                    : AppColor.iconColor,
                              )).tr(),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      widget.letIndexChange(4);
                      setState(() {
                        _open = false;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          FaIcon(
                            FontAwesomeIcons.ellipsis,
                            color: widget.selectedIndex == 4
                                ? AppColor.primary
                                : AppColor.iconColor,
                            size: 18,
                          ),
                          Text("_more",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: widget.selectedIndex == 4
                                    ? AppColor.primary
                                    : AppColor.iconColor,
                              )).tr(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Positioned(
          bottom: 2,
          left: 0,
          right: 0,
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 150),
            transitionBuilder: (Widget child, Animation<double> animation) =>
                ScaleTransition(
              alignment: Alignment.bottomCenter,
              scale: animation,
              child: child,
            ),
            child: _buildSwitcher(),
          ),
        ),
      ],
    );
  }
}

class SaleOptions extends StatelessWidget {
  final VoidCallback? onClose;
  const SaleOptions({Key? key, required this.onClose}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: WaveClipper(),
      child: Container(
        height: 200,
        color: AppColor.color6,
        width: MediaQuery.of(context).size.width - 24,
        child: Column(
          children: [
            Expanded(
                child: Container(
              margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
              child: Column(
                children: [
                  Row(
                    children: [
                      SaleOptionButton(
                        icon: const Icon(
                          Icons.receipt_long_rounded,
                          color: AppColor.primary,
                        ),
                        label: "Sale Receipt",
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(RouteConfig.createReceiptScreen);
                        },
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      SaleOptionButton(
                        icon: const Icon(
                          Icons.receipt,
                          color: AppColor.primary,
                        ),
                        label: "Sale Invoice",
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(RouteConfig.createReceiptScreen);
                        },
                      ),
                    ],
                  )
                ],
              ),
            )),
            IconButton(
              icon: const Icon(
                Icons.close,
                color: AppColor.color8,
              ),
              onPressed: onClose,
            ),
          ],
        ),
      ),
    );
  }
}

class SaleOptionButton extends StatelessWidget {
  final Widget icon;
  final String label;
  final VoidCallback? onPressed;

  const SaleOptionButton(
      {Key? key,
      required this.icon,
      required this.label,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: AppColor.color8,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
      ),
      child: Column(
        children: [
          icon,
          Text(
            label,
            style: const TextStyle(color: AppColor.primary),
          ),
        ],
      ),
    );
  }
}

class LoadCustomerFromPhoneButton extends StatelessWidget {
  const LoadCustomerFromPhoneButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: false,
      create: (ctx) => LoadCustomerContactBloc(db: RepositoryProvider.of(ctx)),
      child: BlocBuilder<LoadCustomerContactBloc, LoadCustomerContactState>(
        builder: (context, state) {
          if (state.status == LoadCustomerContactStatus.permissionDenied) {
            return const ElevatedButton(
                onPressed: null, child: Text("Load Customer From Phone"));
          } else if (state.status == LoadCustomerContactStatus.loading) {
            return const ElevatedButton(
                onPressed: null, child: CircularProgressIndicator());
          }
          return ElevatedButton(
              onPressed: () {
                BlocProvider.of<LoadCustomerContactBloc>(context)
                    .add(LoadCustomerContactFromPhone());
              },
              child: const Text("Load Customer From Phone"));
        },
      ),
    );
  }
}
