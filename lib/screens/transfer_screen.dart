import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controllers/navigation_controller.dart';
import '../models/customer.dart';

class TransferScreen extends StatelessWidget {
  final nav = Get.put(NavigationController());
  Customer? customer;
  final ctr = Get.put(CustomerController());

  TransferScreen({Key? key, required this.customer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Transfer Funds',
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
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const Text(
                'Transfer from:',
                style: TextStyle(
                  fontFamily: 'Josefin Sans',
                  fontWeight: FontWeight.normal,
                  fontSize: 25,
                ),
              ),
              const SizedBox(height: 20.0,),
              Container(
                decoration: const BoxDecoration(

                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        '${customer?.lastName} ${customer?.firstName}',
                      style: const TextStyle(
                        fontFamily: 'Josefin Sans',
                        fontWeight: FontWeight.normal,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 10.0,),
                    Text(
                        'Balance: ${customer?.account.balance}',
                      style: const TextStyle(
                        fontSize: 12,
                        fontFamily: 'Rubik',
                        fontWeight: FontWeight.bold,
                        color: Colors.orange,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20.0,),
              Form(
                key: _formKey,
                child: TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Enter account number',
                      hintText: 'e.g. 0123456789',
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
                    if (entry!.length < 10) {
                      return 'Account number must be 10 digits.';
                    }
                    return null;
                  },
                  onChanged: (entry) {
                    ctr.accountController.text = entry;
                  },
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(height: 20.0,),
              ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      Customer? loggedInCustomer = await ctr.makePayent();
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
                    'Send',
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: 'Rubik',
                      fontWeight: FontWeight.bold,
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
