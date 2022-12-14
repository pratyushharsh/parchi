import 'package:flutter/material.dart';

import '../login/login_view.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const LandingScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
const SizedBox(
                height: 100,
              ),
              const Text("Landing Screen"),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(context, LoginView.route(),);
                },
                child: const Text("Login"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
