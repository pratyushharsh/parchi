import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../config/route_config.dart';
import '../authentication/bloc/authentication_bloc.dart';
import '../sync/bloc/background_sync_bloc.dart';
import '../../config/theme_settings.dart';
import '../../repositories/business_repository.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/my_loader.dart';
import '../business/business_view.dart';
import 'bloc/settings_bloc.dart';

const String dummyImage =
    'https://images.unsplash.com/photo-1541569863345-f97c6484a917?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=3570&q=80';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  void refresh() {
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        var storeId =
            BlocProvider.of<AuthenticationBloc>(context).state.store?.rtlLocId;
        if (storeId != null) {
          try {
            await RepositoryProvider.of<BusinessRepository>(context)
                .findAndPersistBusiness(storeId);
          } catch (e) {
            // print(e);
          }
        }
      },
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              const ProfileCard(),
              const SizedBox(
                height: 50,
              ),
              BlocBuilder<AuthenticationBloc, AuthenticationState>(
                builder: (context, state) {
                  return AccountWidget(
                    name:
                        "${state.employee?.firstName ?? ""} ${state.employee?.middleName ?? ""} ${state.employee?.lastName ?? ""}",
                    role: "Store User",
                    data: Detail(
                      title: "_settingsAccount",
                      subtitle: "_settingsAccountDescription",
                      icon: Icons.sync_alt_outlined,
                      children: [
                        SettingsItem(
                            text: "_email",
                            subtext: state.employee?.email,
                            onTap: () {}),
                        SettingsItem(
                            text: "_phone",
                            subtext: state.employee?.phone,
                            onTap: () {}),
                      ],
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 40,
              ),
              SectionWidget(
                data: Detail(
                  title: "_storeSettings",
                  subtitle: "_storeSettingsDescription",
                  icon: Icons.home_repair_service,
                  children: [
                    SettingsItem(
                        text: "_employeeMaintenance",
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(RouteConfig.employeeScreen);
                        }),
                    // SettingsItem(text: "Feature Settings", onTap: () {}),
                    SettingsItem(
                        text: "_changeLocale",
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(RouteConfig.localeScreen)
                              .then((value) {
                            if (value != null && value is Locale) {
                              EasyLocalization.of(context)?.setLocale(value).then((value) => refresh());
                            }
                          });
                        }),
                    SettingsItem(
                      text: "_taxConfiguration",
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed(RouteConfig.taxConfigurationScreen);
                      },
                    ),
                    SettingsItem(
                      text: "_sequenceConfiguration",
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed(RouteConfig.sequenceConfigScreen);
                      },
                    ),
                    SettingsItem(
                      text: "_invoiceConfiguration",
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed(RouteConfig.invoiceSettingViewScreen);
                      },
                    ),
                    SettingsItem(
                      text: "_receiptConfiguration",
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed(RouteConfig.receiptSettingViewScreen);
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              SectionWidget(
                data: Detail(
                  title: "_settings",
                  subtitle: "_settingsDescription",
                  icon: Icons.settings,
                  children: [
                    // SettingsItem(
                    //     text: "Sync Data",
                    //     onTap: () async {
                    //       BlocProvider.of<BackgroundSyncBloc>(context)
                    //           .add(SyncAllConfigDataEvent(forceSync: true));
                    //     }),
                    SettingsItem(
                        text: "Item Price",
                        onTap: () async {

                        }),
                  ],
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              SectionWidget(
                data: Detail(
                  title: "_helpAndFeedback",
                  subtitle: "_helpAndFeedbackDescription",
                  icon: Icons.mail_rounded,
                  children: [
                    // SettingsItem(
                    //   text: "Load Sample Data",
                    //   onTap: () {
                    //     BlocProvider.of<BackgroundSyncBloc>(context)
                    //         .add(LoadSampleData());
                    //   },
                    // ),
                    // SettingsItem(
                    //   text: "Load Full Data",
                    //   onTap: () {
                    //     BlocProvider.of<BackgroundSyncBloc>(context)
                    //         .add(LoadSampleData(fullImport: true));
                    //   },
                    // ),
                    // SettingsItem(
                    //   text: "Export Data",
                    //   onTap: () {
                    //     BlocProvider.of<BackgroundSyncBloc>(context)
                    //         .add(ExportDataEvent());
                    //   },
                    // ),
                    SettingsItem(text: "_faqVideos", onTap: () {}),
                    SettingsItem(text: "_contactUs", onTap: () {}),
                    SettingsItem(
                        text: "_about",
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(RouteConfig.aboutScreen);
                        }),
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              const SwitchBusinessAccountWidget(),
              const SizedBox(
                height: 50,
              ),
              SizedBox(
                width: double.infinity,
                child: RejectButton(
                    label: "_logout",
                    onPressed: () {
                      BlocProvider.of<AuthenticationBloc>(context)
                          .add(LogOutUserEvent());
                    }),
              ),
              const SizedBox(
                height: 300,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        if (state.store == null) {
          return const SizedBox();
        }

        return Column(
          children: [
            InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(RouteConfig.businessViewScreen,
                    arguments: state.store?.rtlLocId);
              },
              child: Hero(
                tag: "business-logo",
                child: CircleAvatar(
                  backgroundImage: (state.store!.logo != null &&
                          state.store!.logo!.isNotEmpty)
                      ? NetworkImage(state.store!.logo![0])
                      : const NetworkImage(
                          'https://images.unsplash.com/photo-1541569863345-f97c6484a917?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=3570&q=80'),
                  maxRadius: 60,
                  child: const Text(
                    "",
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "${state.store?.storeName}",
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
            ),
          ],
        );
      },
    );
  }
}

class SectionWidget extends StatelessWidget {
  final Detail data;

  const SectionWidget({Key? key, required this.data}) : super(key: key);

  Widget _buildButton(SettingsItem item) {
    return InkWell(
      onTap: item.onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              item.text,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ).tr(),
            const Icon(Icons.chevron_right)
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                  color: AppColor.primary,
                  borderRadius: BorderRadius.circular(8)),
              child: Center(
                child: Icon(
                  data.icon,
                  size: 22,
                  color: AppColor.color1,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18),
                ).tr(),
                Text(
                  data.subtitle,
                  style: const TextStyle(
                      fontWeight: FontWeight.normal,
                      fontStyle: FontStyle.italic,
                      color: AppColor.subtitleColorPrimary,
                      fontSize: 14),
                ).tr(),
              ],
            )
          ],
        ),
        const SizedBox(
          height: 25,
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(17),
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
            elevation: 0,
            margin: const EdgeInsets.all(0),
            child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: data.children.length,
                itemBuilder: (ctx, idx) {
                  if (idx == data.children.length - 1) {
                    return _buildButton(data.children[idx]);
                  }
                  return Column(
                    children: [
                      _buildButton(data.children[idx]),
                      const Divider(height: 0)
                    ],
                  );
                }),
          ),
        )
      ],
    );
  }
}

class SwitchBusinessAccountWidget extends StatefulWidget {
  const SwitchBusinessAccountWidget({Key? key}) : super(key: key);

  @override
  State<SwitchBusinessAccountWidget> createState() =>
      _SwitchBusinessAccountWidgetState();
}

class _SwitchBusinessAccountWidgetState
    extends State<SwitchBusinessAccountWidget>
    with SingleTickerProviderStateMixin {
  double turns = 0;
  bool open = false;

  @override
  void initState() {
    super.initState();
    // _controller = AnimationController(
    //   vsync: this,
    //   duration: const Duration(milliseconds: 800),
    // );
  }

  @override
  void dispose() {
    // _controller.dispose();
    super.dispose();
  }

  // Widget _buildInvalidUser() {
  //   return const Text(
  //     "You are not a valid user",
  //     style: TextStyle(
  //         color: AppColor.subtitleColorPrimary,
  //         fontWeight: FontWeight.w500,
  //         fontSize: 15),
  //   );
  // }

  Widget _buildNewBusinessButton() {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(BusinessView.route());
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: Row(
          children: [
            const Icon(Icons.add),
            const SizedBox(
              width: 10,
            ),
            const Text(
              "_addNewBusiness",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ).tr(),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    AuthenticationState state =
        BlocProvider.of<AuthenticationBloc>(context).state;
    String rtlLocId = '${state.store!.rtlLocId}';

    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(17),
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
            elevation: 0,
            margin: const EdgeInsets.all(0),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 400),
              child: Column(children: [
                InkWell(
                  onTap: () {
                    if (open) {
                      setState(() {
                        turns -= 1 / 4;
                      });
                    } else {
                      BlocProvider.of<SettingsBloc>(context)
                          .add(FetchUserBusiness());
                      setState(() {
                        turns += 1 / 4;
                      });
                    }
                    open = !open;
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          '_switchBusinessAccount',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ).tr(),
                        AnimatedRotation(
                          turns: turns,
                          duration: const Duration(milliseconds: 800),
                          child: const Icon(Icons.chevron_right),
                        )
                      ],
                    ),
                  ),
                ),
                const Divider(height: 0),
                if (open && state.status == SettingsStatus.loadingBusiness)
                  const MyLoader(color: AppColor.primary),
                if (open &&
                    !(state.status == SettingsStatus.loadingBusiness ||
                        state.status == SettingsStatus.loadingBusinessFailure))
                  ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: state.business.length + 1,
                      itemBuilder: (ctx, idx) {
                        if (idx == state.business.length) {
                          return _buildNewBusinessButton();
                        }

                        return Column(
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Container(
                                padding: const EdgeInsets.only(
                                    top: 4, bottom: 4, left: 16, right: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      state.business[idx].storeId ??
                                          'Invalid Store',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    ),
                                    Radio<String>(
                                      value: state.business[idx].storeId!,
                                      groupValue: rtlLocId,
                                      onChanged: (value) {
                                        if (value != null &&
                                            value != rtlLocId) {
                                          BlocProvider.of<AuthenticationBloc>(
                                                  context)
                                              .add(
                                                  ChangeBusinessAccount(value));
                                        }
                                      },
                                    )
                                  ],
                                ),
                              ),
                            ),
                            const Divider(height: 0)
                          ],
                        );
                      })
              ]),
            ),
          ),
        );
      },
    );
  }
}

class AccountWidget extends StatelessWidget {
  final Detail data;
  final String name;
  final String role;

  const AccountWidget(
      {Key? key, required this.data, required this.name, required this.role})
      : super(key: key);

  Widget _buildButton(SettingsItem item) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.text,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: AppColor.subtitleColorPrimary),
              ).tr(),
              const SizedBox(
                height: 6,
              ),
              if (item.subtext != null)
                Text(
                  item.subtext!,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 14),
                ),
            ],
          ),
          const Icon(Icons.chevron_right)
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                  color: AppColor.primary,
                  borderRadius: BorderRadius.circular(8)),
              child: Center(
                child: Icon(
                  data.icon,
                  size: 22,
                  color: AppColor.color1,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18),
                ).tr(),
                Text(
                  data.subtitle,
                  style: const TextStyle(
                      fontWeight: FontWeight.normal,
                      fontStyle: FontStyle.italic,
                      color: AppColor.subtitleColorPrimary,
                      fontSize: 14),
                ).tr(),
              ],
            )
          ],
        ),
        const SizedBox(
          height: 25,
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(17),
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
            elevation: 0,
            margin: const EdgeInsets.all(0),
            child: InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(
                    RouteConfig.employeeDetailScreen,
                    arguments: BlocProvider.of<AuthenticationBloc>(context)
                        .state
                        .employee);
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: FadeInImage(
                              height: 40,
                              width: 40,
                              placeholder: const AssetImage(
                                  "assets/image/logo-dummy.png"),
                              image: const NetworkImage(dummyImage),
                              imageErrorBuilder: (ctx, err, trace) {
                                return const CircleAvatar(
                                  backgroundColor: Colors.red,
                                  child: Icon(
                                    Icons.person,
                                    color: Colors.white,
                                  ),
                                );
                              },
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  name,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                Text(
                                  role,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13,
                                      color: AppColor.subtitleColorPrimary),
                                )
                              ],
                            ),
                          ),
                          const Icon(Icons.chevron_right)
                        ],
                      ),
                    ),
                    ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: data.children.length,
                        itemBuilder: (ctx, idx) {
                          if (idx == data.children.length - 1) {
                            return _buildButton(data.children[idx]);
                          }
                          return Column(
                            children: [
                              _buildButton(data.children[idx]),
                              const Divider()
                            ],
                          );
                        }),
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

class Detail {
  final IconData icon;
  final String title;
  final String subtitle;
  final List<SettingsItem> children;

  Detail(
      {required this.icon,
      required this.title,
      required this.subtitle,
      this.children = const []});
}

class SettingsItem {
  final String text;
  final String? subtext;
  final GestureTapCallback? onTap;

  SettingsItem({required this.text, required this.onTap, this.subtext});
}
