import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/navigation_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final nav = Get.put(NavigationController());
    DateTime? _currentBackPressTime;

    return WillPopScope(
      onWillPop: () async {
        DateTime now = DateTime.now();

        if (_currentBackPressTime == null ||
            now.difference(_currentBackPressTime!) > const Duration(seconds: 2)) {
          _currentBackPressTime = now;

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Press back button again to exit'),
            ),
          );

          return false;
        }
        return true;
      },
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      CircleAvatar(
                        backgroundImage: AssetImage(
                            'assets/images/logo-grey.png',
                        ),
                        radius: 20,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Container(
                    child: Image.asset(
                        'assets/images/logo-image.png'
                    ),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  const Center(
                    child: Text(
                      'SERYX BANK',
                      style: TextStyle(
                        fontFamily: 'Josefin Sans',
                        fontWeight: FontWeight.w800,
                        fontSize: 30,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  const Center(
                    child: Text(
                      "We're your No. 1 banking partner.",
                      style: TextStyle(
                        fontFamily: 'Rubik',
                        fontWeight: FontWeight.normal,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 100.0,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                          onPressed: () => nav.navigateToRegister(),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple[700],
                          fixedSize: const Size(300, 40),
                        ),
                          child: const Text(
                            'Sign Up / Register',
                            style: TextStyle(
                              fontSize: 12,
                              fontFamily: 'Rubik',
                              fontWeight: FontWeight.bold
                            ),
                          )
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      OutlinedButton(
                          onPressed: () {
                            nav.navigateToLogin();
                          },
                          style: OutlinedButton.styleFrom(
                            fixedSize: const Size(300, 40),
                          ),
                          child: const Text(
                            'Login',
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: 'Rubik',
                                fontWeight: FontWeight.bold,
                                color: Colors.purple,
                            ),
                          )
                      ),
                    ],
                  )

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
