import 'package:Parchi/src/repositories/repository.dart';
import 'package:amazon_cognito_identity_dart_2/cognito.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'my_app.dart';
import 'src/repositories/price_repository.dart';
import 'src/util/helper/rest_api.dart';

class MyAppRepoProviders extends StatelessWidget {
  final CognitoUserPool userPool;
  final RestApiClient restClient;
  const MyAppRepoProviders(
      {Key? key, required this.userPool, required this.restClient})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(lazy: false, create: (context) => restClient),
        RepositoryProvider(create: (context) => ContactRepository()),
        RepositoryProvider(create: (context) => userPool),
        RepositoryProvider(
          create: (context) => BusinessRepository(
            restClient: restClient,
          ),
        ),
        RepositoryProvider(
          create: (context) => SyncRepository(
            restClient: restClient,
          ),
        ),
        RepositoryProvider(
          create: (context) => SyncConfigRepository(),
        ),
        RepositoryProvider(
          create: (context) => SettingsRepository(restClient: restClient),
        ),
        RepositoryProvider(
          create: (context) => SequenceRepository(restClient: restClient),
        ),
        RepositoryProvider(
          create: (context) => TransactionRepository(restClient: restClient),
        ),
        RepositoryProvider(
          create: (context) => ConfigRepository(),
        ),
        RepositoryProvider(
          create: (context) => ReasonCodeRepository(restClient: restClient),
        ),
        RepositoryProvider(
          create: (context) => TaxRepository(restClient: restClient),
        ),
        RepositoryProvider(
          create: (context) => EmployeeRepository(restClient: restClient),
        ),
        RepositoryProvider(
          create: (context) => CustomerRepository(restClient: restClient),
        ),
        RepositoryProvider(
          create: (context) => ProductRepository(restClient: restClient),
        ),
        RepositoryProvider(
          create: (context) => InvoiceRepository(
            restClient: restClient,
          ),
        ),
        RepositoryProvider(
          create: (context) => BulkImportRepository(
            restClient: restClient,
          ),
        ),
        RepositoryProvider(
          create: (context) => DealsRepository(),
        ),
        RepositoryProvider(
          create: (context) => PriceRepository(),
        ),
      ],
      child: const MyApp(),
    );
  }
}
