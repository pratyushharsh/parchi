import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/error_notification_bloc.dart';

class ErrorNotification extends StatelessWidget {
  final Widget child;
  const ErrorNotification({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<ErrorNotificationBloc, ErrorNotificationState>(
      listener: (context, state) {
        var snackBar = SnackBar(
          elevation: 0,
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.transparent,
          content: AwesomeSnackbarContent(
            title: 'On Snap!',
            message: state.errors.join(","),
            /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
            contentType: ContentType.failure,
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
      child: child,
    );
  }
}

class ErrorNotificationCard extends StatelessWidget {
  final String error;
  const ErrorNotificationCard({Key? key, required this.error}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Text(error)
              ],
            ),
          ),
          const Positioned(child: Icon(Icons.close), top: 0, right: 0)
        ],
      ),
    );
  }
}
