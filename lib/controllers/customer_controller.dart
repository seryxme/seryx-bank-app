import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:seryx_bank/dtos/requests/register_customer_request.dart';
import 'package:seryx_bank/services/customer_service.dart';

import '../dtos/requests/login_customer_request.dart';

class CustomerController extends GetxController {
  final CustomerService srv = CustomerService();
  var accountController = TextEditingController();
  var amountController = TextEditingController();

  registerCustomer(RegisterCustomerRequest request) async {
    return await srv.registerCustomer(request);
  }

  loginCustomer(LoginCustomerRequest request) async {
    return await srv.loginCustomer(request);
  }

  makePayment(String sender, String receiver, double amount) async {
    return await srv.makePayment(sender, receiver, amount);
  }
}