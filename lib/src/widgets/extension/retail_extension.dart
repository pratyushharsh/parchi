import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../module/authentication/bloc/authentication_bloc.dart';

extension RetailLocationExtension on StatelessWidget {

  NumberFormat getCurrencyFormatter(BuildContext context) {
    var authBloc = BlocProvider.of<AuthenticationBloc>(context);

    if (authBloc.state.store?.currencyId != null) {
      return NumberFormat.currency(name: authBloc.state.store?.currencyId);
    }

    if (authBloc.state.store?.locale != null && authBloc.state.store?.currencyId != null) {
      return NumberFormat.simpleCurrency(locale: authBloc.state.store?.locale, name: authBloc.state.store?.currencyId);
    }

    if (authBloc.state.store?.locale != null) {
      return NumberFormat.simpleCurrency(locale: authBloc.state.store?.locale);
    }

    return NumberFormat.simpleCurrency();
  }
}

extension RetailLocationExtensionStateFul on State {

  NumberFormat getCurrencyFormatter(BuildContext context) {
    var authBloc = BlocProvider.of<AuthenticationBloc>(context);

    if (authBloc.state.store?.currencyId != null) {
      return NumberFormat.currency(name: authBloc.state.store?.currencyId);
    }

    if (authBloc.state.store?.locale != null && authBloc.state.store?.currencyId != null) {
      return NumberFormat.simpleCurrency(locale: authBloc.state.store?.locale, name: authBloc.state.store?.currencyId);
    }

    if (authBloc.state.store?.locale != null) {
      return NumberFormat.simpleCurrency(locale: authBloc.state.store?.locale);
    }

    return NumberFormat.simpleCurrency();
  }
}
