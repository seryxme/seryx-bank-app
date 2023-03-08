import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controllers/customer_controller.dart';
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
    String message = ' ';

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
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 80.0,),
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
                  padding: const EdgeInsets.all(12.0),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    border: Border(
                      top: BorderSide(
                        color: Colors.purple,
                        style: BorderStyle.solid,
                        width: 1.0,
                      ),
                      left: BorderSide(
                        color: Colors.purple,
                        style: BorderStyle.solid,
                        width: 1.0,
                      ),
                      right: BorderSide(
                        color: Colors.purple,
                        style: BorderStyle.solid,
                        width: 1.0,
                      ),
                      bottom: BorderSide(
                        color: Colors.purple,
                        style: BorderStyle.solid,
                        width: 1.0,
                      ),
                    )
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(width: 300.0,),
                      Text(
                          '${customer?.lastName} ${customer?.firstName}'.toUpperCase(),
                        style: const TextStyle(
                          fontFamily: 'Josefin Sans',
                          fontWeight: FontWeight.normal,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(height: 10.0,),
                      Text(
                          'Balance: N${customer?.account.balance}',
                        style: const TextStyle(
                          fontSize: 15,
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
                  child: Column(
                    children: [
                      TextFormField(
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
                      const SizedBox(height: 20.0,),
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: 'Enter amount to transfer',
                            hintText: '1000',
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
                          if (double.parse(entry!) > customer!.account.doubleBalance) {
                            return 'Your balance is insufficient for this transfer';
                          }
                          return null;
                        },
                        onChanged: (entry) {
                          ctr.amountController.text = entry;
                        },
                        keyboardType: TextInputType.number,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20.0,),
                ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        message = await ctr.makePayment(
                          customer!.account.accountNum!,
                          ctr.accountController.text,
                            double.parse(ctr.amountController.text)
                        );
                        // AppAlertDialog.showAlertDialog(
                        //   context: context,
                        //   title: 'Oops!',
                        //   description: 'Two birds flying in the sky',
                        //   buttonText: 'View Result', );
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        message!,
                      style: const TextStyle(
                        fontFamily: 'Josefin Sans',
                        fontWeight: FontWeight.normal,
                        fontSize: 15,
                      ),

                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
