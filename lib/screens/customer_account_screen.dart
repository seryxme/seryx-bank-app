import 'package:flutter/material.dart';

import '../models/customer.dart';

class CustomerAccountScreen extends StatelessWidget {
  final Customer? customer;

  const CustomerAccountScreen({Key? key, required this.customer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Welcome ${customer?.firstName} ${customer?.lastName}'
        ),
        centerTitle: true,
      ),
    );
  }
}
