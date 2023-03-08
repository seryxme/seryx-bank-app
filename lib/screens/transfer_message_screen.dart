import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controllers/navigation_controller.dart';
import '../models/customer.dart';

class TransferMessageScreen extends StatelessWidget {
  Customer? customer;
  String? message;
  final nav = Get.put(NavigationController());

  TransferMessageScreen({super.key, required this.customer, required this.message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Transfer Successful',
        ),
        titleTextStyle: const TextStyle(
          fontFamily: 'Montserrat',
          color: Colors.white,
        ),
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
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                '${customer?.firstName} ${customer?.lastName}, $message',
                style: const TextStyle(
                  fontSize: 20,
                  fontFamily: 'Rubik',
                  fontWeight: FontWeight.bold,
                  color: Colors.purple,
                ),
                textAlign: TextAlign.center,
              ),
              ElevatedButton(
                  onPressed: () => nav.navigateToLogin(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple[700],
                    fixedSize: const Size(300, 40),
                  ),
                  child: const Text(
                    'Back',
                    style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'Rubik',
                        fontWeight: FontWeight.bold
                    ),
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
