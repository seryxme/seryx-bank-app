import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seryx_bank/dtos/requests/register_customer_request.dart';
import 'package:seryx_bank/models/customer.dart';

import '../controllers/navigation_controller.dart';
import '../dtos/responses/register_customer_response.dart';

class SuccessScreen extends StatelessWidget {
  final RegisterCustomerResponse response;
  final nav = Get.put(NavigationController());

  SuccessScreen({super.key, required this.response});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Registration Successful',
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
                '${response.firstName} ${response.lastName}, ${response.message}',
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
                    'Login',
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


      // Container(
      //   margin: EdgeInsets.all(10.0),
      //   child: Column(
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [
      //       CustomerData(
      //         field: 'First Name: ',
      //         data: customer.firstName,
      //       ),
      //
      //     ],
      //   ),
      // ),
    );
  }
}

class CustomerData extends StatelessWidget {
  final String field;
  final String data;

  const CustomerData({
    super.key,
    required this.field,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          color: Colors.purple[700],
          padding: const EdgeInsets.all(8.0),
          child: Text(
            field,
            style: const TextStyle(
              fontSize: 20,
              fontFamily: 'Rubik',
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        Text(
          data,
          style: const TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 20.0,
          ),
        ),
      ],


    );
  }
}
