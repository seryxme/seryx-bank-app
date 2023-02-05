import 'package:flutter/material.dart';

import '../models/customer.dart';

class CustomerAccountScreen extends StatelessWidget {
  final Customer? customer;

  const CustomerAccountScreen({Key? key, required this.customer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu_rounded),
        actions: const [
        Text(
        'Main Account',
      ),
          Icon(Icons.person)
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              const Text(
                'Dashboard',
                style: TextStyle(
                  fontFamily: 'Josefin Sans',
                  fontWeight: FontWeight.w800,
                  fontSize: 30,
                ),),
              SizedBox(height: 30.0,),
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  color: Colors.blueGrey,
                ),
                  child: Text(
                      'Welcome ${customer?.firstName},'
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
