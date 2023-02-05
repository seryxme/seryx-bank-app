import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:seryx_bank/screens/home_screen.dart';
import 'package:seryx_bank/services/customer_service.dart';

import '../controllers/customer_controller.dart';
import '../controllers/navigation_controller.dart';
import '../dtos/requests/login_customer_request.dart';
import '../models/customer.dart';
import 'customer_account_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final nav = Get.put(NavigationController());
  final _formKey = GlobalKey<FormState>();
  final ctr = Get.put(CustomerController());
  LoginCustomerRequest request = LoginCustomerRequest();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Login',
        ),
        titleTextStyle: const TextStyle(
          fontFamily: 'Montserrat',
          color: Colors.white,
        ),
        centerTitle: true,
        actions: const [
          CircleAvatar(
            backgroundImage: AssetImage(
              'assets/images/logo-white.png',
            ),
            radius: 20,
          )
        ],
        backgroundColor: Colors.purple[700],
      ),
      body: SafeArea(
        child: ListView(
          padding:  const EdgeInsets.symmetric(
            horizontal: 24.0,
          ),
          children: [
            const SizedBox(
              height: 80.0,
            ),
            Column(
              children: const [
                CircleAvatar(
                  backgroundImage: AssetImage(
                    'assets/images/logo-image.png',
                  ),
                  radius: 30.0,
                ),
                SizedBox(
                  height: 16.0,
                ),
                Center(
                  child: Text(
                    'SERYX BANK',
                    style: TextStyle(
                      fontFamily: 'Josefin Sans',
                      fontWeight: FontWeight.w800,
                      fontSize: 30,
                    ),
                  ),
                ),
                SizedBox(
                  height: 80.0,
                ),
              ],
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Email',
                        hintText: 'e.g. tunde.seriki@provider.com',
                        hintStyle: const TextStyle(
                          color: Colors.grey,
                          fontStyle: FontStyle.italic,
                        ),
                        contentPadding: const EdgeInsets.all(10.0),
                        border: InputBorder.none,
                        filled: true,
                        fillColor: Colors.grey[200]
                    ),
                    validator: (entry) {
                      if (entry!.isEmpty) {
                        return 'Please, enter a valid email address.';
                      }
                      return null;
                    },
                    onChanged: (entry) {
                      setState(() {
                        request.email = entry;
                      });
                    },
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Password',
                        hintText: 'At least 8 characters',
                        hintStyle: const TextStyle(
                          color: Colors.grey,
                          fontStyle: FontStyle.italic,
                        ),
                        contentPadding: const EdgeInsets.all(10.0),
                        border: InputBorder.none,
                        filled: true,
                        fillColor: Colors.grey[200]
                    ),
                    validator: (entry) {
                      if (entry!.length < 8) {
                        return 'Password cannot be less than 8 characters.';
                      }
                      _formKey.currentState!.save();
                      return null;
                    },
                    onChanged: (entry) {
                      setState(() {
                        request.password = entry;
                      });
                    },
                    obscureText: true,
                  ),
                ],
              ),
            ),
            OverflowBar(
              alignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: () {
                      request.email = '';
                      request.password = '';
                    },
                    child: const Text(
                      'Clear',
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'Rubik',
                        fontWeight: FontWeight.bold,
                        color: Colors.purple,
                      ),
                    )
                ),
                ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        Customer? loggedInCustomer = await ctr.loginCustomer(request);
                        if (loggedInCustomer != null) {
                          nav.navigateToCustomerAccount(loggedInCustomer);
                        }
                        else {
                          nav.navigateToHome();
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple[700],
                    ),
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'Rubik',
                        fontWeight: FontWeight.bold,
                      ),
                    )
                ),
              ],
            )
          ],
        )
      ),
    );
  }
}
