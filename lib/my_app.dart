import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'src/config/cache_manager.dart';

import 'src/config/route_config.dart';
import 'src/module/authentication/bloc/authentication_bloc.dart';
import 'src/module/bulk_import/bloc/bulk_import_bloc.dart';
import 'src/module/business/business_view.dart';
import 'src/module/home/home_view.dart';
import 'src/module/landing/landing_screen.dart';
import 'src/module/load_item_bulk/bloc/load_item_bulk_bloc.dart';
import 'src/module/login/bloc/login_bloc.dart';
import 'src/module/login/login_view.dart';
import 'src/module/login/verify_user_device_view.dart';
import 'src/module/login/verify_user_view.dart';
import 'src/module/sync/bloc/background_sync_bloc.dart';
import 'src/pos/calculator/deals_calculator.dart';
import 'src/pos/calculator/price_calculator.dart';
import 'src/pos/calculator/tax_calculator.dart';
import 'src/pos/calculator/total_calculator.dart';
import 'src/pos/helper/deals_helper.dart';
import 'src/pos/helper/discount_helper.dart';
import 'src/pos/helper/price_helper.dart';
import 'src/pos/helper/tax_helper.dart';
import 'src/widgets/my_loader.dart';
import 'src/config/theme_settings.dart';
import 'src/module/error/bloc/error_notification_bloc.dart';
import 'src/module/error/error_notification.dart';
import 'src/module/login/choose_create_business_view.dart';
import 'src/module/settings/bloc/settings_bloc.dart';
import 'src/repositories/checklist_helper.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('build MyApp');
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => CheckListHelper()),
        RepositoryProvider(
          create: (context) => TaxHelper(),
        ),
        RepositoryProvider(
          create: (context) => TaxModifierCalculator(
            taxRepository: RepositoryProvider.of(context),
            taxHelper: RepositoryProvider.of(context),
          ),
        ),
        RepositoryProvider(
          create: (context) => DealsHelper(
            dealsRepository: RepositoryProvider.of(context),
          ),
        ),
        RepositoryProvider(
          create: (context) => DiscountHelper(),
        ),
        RepositoryProvider(
          create: (ctx) => PriceHelper(),
        ),
        RepositoryProvider(
          create: (ctx) => TotalCalculator(),
        ),
        RepositoryProvider(
          create: (context) => PriceCalculator(
            priceRepository: RepositoryProvider.of(context),
          ),
        ),RepositoryProvider(
          create: (context) => DealsCalculator(
            dealsRepository: RepositoryProvider.of(context),
            dealsHelper: RepositoryProvider.of(context),
          ),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            lazy: false,
            create: (context) => BackgroundSyncBloc(
              syncRepository: RepositoryProvider.of(context),
              syncConfigRepository: RepositoryProvider.of(context),
              invoiceRepository: RepositoryProvider.of(context),
              productRepository: RepositoryProvider.of(context),
            ),
          ),
          BlocProvider(
            create: (context) => AuthenticationBloc(
                userPool: RepositoryProvider.of(context),
                employeeRepository: RepositoryProvider.of(context),
                businessRepository: RepositoryProvider.of(context),
                sync: BlocProvider.of(context))
              ..add(
                InitialAuthEvent(),
              ),
          ),
          BlocProvider(
            create: (context) => ErrorNotificationBloc(
              checkListHelper: RepositoryProvider.of(context),
              authenticationBloc: BlocProvider.of(context),
            )..add(ValidateStoreSetup()),
          ),
          BlocProvider(
            create: (context) => LoginBloc(
              userPool: RepositoryProvider.of(context),
              authenticationBloc: BlocProvider.of(context),
              errorNotificationBloc: BlocProvider.of(context),
            )..add(OnCountryChange(SettingsCacheManager()
                .getDefaultElement(SettingsType.country))),
          ),
          BlocProvider(
            create: (context) => LoadItemBulkBloc(
                auth: BlocProvider.of(context),
                sequenceRepository: RepositoryProvider.of(context)),
          ),
          BlocProvider(
            create: (context) => SettingsBloc(
                employeeRepository: RepositoryProvider.of(context),
                authenticationBloc: BlocProvider.of(context)),
          ),
          BlocProvider(
            create: (context) => BulkImportBloc(
              bulkImportRepository: RepositoryProvider.of(context),
            ),
          ),
        ],
        child: const MyAppView(),
      ),
    );
  }
}

class MyAppView extends StatefulWidget {
  const MyAppView({Key? key}) : super(key: key);

  @override
  State<MyAppView> createState() => _MyAppViewState();
}

class _MyAppViewState extends State<MyAppView> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => _navigatorKey.currentState!;

  // @override
  // void initState() {
  //   super.initState();
  //   WidgetsBinding.instance
  //       .addPostFrameCallback((_) {
  //         BlocProvider.of<ErrorNotificationBloc>(context).add(PeriodicValidatorStartEvent());
  //   });
  // }
  //
  // @override
  // void dispose() {
  //   BlocProvider.of<ErrorNotificationBloc>(context).add(PeriodicValidatorStopEvent());
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: _navigatorKey,
      theme: ThemeData.light().copyWith(
        primaryColor: AppColor.primary,
        brightness: Brightness.light,
        backgroundColor: AppColor.background,
        dividerColor: Colors.white54,
        colorScheme: const ColorScheme.light(primary: AppColor.primary),
        textTheme: GoogleFonts.latoTextTheme(Theme.of(context).textTheme),
      ),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      builder: (context, child) {
        return ErrorNotification(
          child: BlocListener<AuthenticationBloc, AuthenticationState>(
            listenWhen: (previous, current) {
              return true;
            },
            listener: (context, state) async {
              switch (state.status) {
                case AuthenticationStatus.authenticated:
                  _navigator.pushAndRemoveUntil<void>(
                    HomeScreen.route(),
                    (route) => false,
                  );
                  break;
                case AuthenticationStatus.unauthenticated:
                  _navigator.pushAndRemoveUntil<void>(
                    LoginView.route(),
                    (route) => false,
                  );
                  break;
                case AuthenticationStatus.unknown:
                  _navigator.pushAndRemoveUntil<void>(
                    LandingScreen.route(),
                    (route) => false,
                  );
                  break;
                case AuthenticationStatus.verifyUser:
                  _navigator.push(VerifyUserView.route());
                  break;
                case AuthenticationStatus.newUser:
                  _navigator.push<void>(
                    BusinessView.route(),
                  );
                  break;
                case AuthenticationStatus.verifyUserDevice:
                  _navigator.push(VerifyUserDeviceView.route());
                  break;
                case AuthenticationStatus.chooseBusiness:
                  _navigator.push(ChooseCreateBusinessView.route());
                  break;
                case AuthenticationStatus.chooseBusinessLoading:
                  _navigator.push(
                    DialogRoute<void>(
                      context: context,
                      builder: (context) => const Center(
                        child: MyLoader(),
                      ),
                    ),
                  );
                  break;
                default:
                  break;
              }
            },
            child: child,
          ),
        );
      },
      onGenerateRoute: RouteConfig.onGenerateRoute,
    );
  }
}
