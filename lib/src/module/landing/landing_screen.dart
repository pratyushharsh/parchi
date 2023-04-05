import 'package:flutter/material.dart';

import '../../config/constants.dart';
import '../../config/theme_settings.dart';
import '../login/login_view.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const LandingScreen());
  }

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  final _pageViewController = PageController(initialPage: 0);

  int _activePage = 0;

  final int _numPages = 3;

  void _onPageChanged(int index) {
    setState(() {
      _activePage = index;
    });
  }

  void onNextPage() {
    _pageViewController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          const LoginView(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        final tween = Tween(begin: begin, end: end);
        final offsetAnimation = animation.drive(tween);
        return ScaleTransition(
          scale: animation,
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageViewController,
            itemCount: 3,
            itemBuilder: (context, index) {
              if (index == 0) {
                return Page1(onPageChange: onNextPage);
              }

              if (index == 1) {
                return Page2(onPageChange: onNextPage);
              }

              if (index == 2) {
                return Page3(onPageChange: () {
                  Navigator.pushReplacement(
                    context,
                    _createRoute(),
                  );
                });
              }
              return Container();
            },
            onPageChanged: (index) {
              setState(() {
                _activePage = index;
              });
            },
          ),
          Positioned(
            bottom: 15,
            left: 0,
            right: 0,
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List<Widget>.generate(
                  _numPages,
                  (index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: InkWell(
                          onTap: () {
                            _pageViewController.animateToPage(index,
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeIn);
                          },
                          child: CircleAvatar(
                            radius: 5,
                            // check if a dot is connected to the current page
                            // if true, give it a different color
                            backgroundColor: _activePage == index
                                ? Colors.black87
                                : Colors.grey,
                          ),
                        ),
                      )),
            ),
          ),
        ],
      ),
    );
  }
}

class Page1 extends StatelessWidget {
  final Function onPageChange;
  const Page1({Key? key, required this.onPageChange}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Scaffold(
        // backgroundColor: Colors.orange,
        body: SafeArea(
          child: Column(
            children: [
              Expanded(child: Image.asset("assets/image/UI_Mobile_Shop.webp")),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppColor.primary,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Page1Button(onPageChange: onPageChange),
              ),
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  "Effortless sales on the go.",
                  style: TextStyle(
                    fontSize: 40,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Page1Button extends StatelessWidget {
  final Function onPageChange;
  const Page1Button({Key? key, required this.onPageChange}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPageChange();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text(
            "Get Started",
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
          Icon(
            Icons.arrow_forward_ios_outlined,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  final Function onPageChange;
  const Page2({Key? key, required this.onPageChange}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Scaffold(
        // backgroundColor: Colors.orange,
        body: SafeArea(
          child: Column(
            children: [
              Expanded(child: Image.asset("assets/image/p3.png")),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppColor.primary,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: InkWell(
                  key: const Key("Page2Button"),
                  onTap: () {
                    onPageChange();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Get Started",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  "Your sales, anytime, anywhere.",
                  style: TextStyle(
                    fontSize: 40,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Page3 extends StatelessWidget {
  final Function onPageChange;
  const Page3({Key? key, required this.onPageChange}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Scaffold(
        // backgroundColor: Colors.orange,
        body: SafeArea(
          child: Column(
            children: [
              Expanded(child: Image.asset("assets/image/p2.png")),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppColor.primary,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: InkWell(
                  key: const Key("Page3Button"),
                  onTap: () {
                    onPageChange();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Get Started",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  "Easily manage sales from your phone.",
                  style: TextStyle(
                    fontSize: 40,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
