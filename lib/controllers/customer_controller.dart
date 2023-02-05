import 'package:get/get.dart';
import 'package:seryx_bank/dtos/requests/register_customer_request.dart';
import 'package:seryx_bank/services/customer_service.dart';

import '../dtos/requests/login_customer_request.dart';

final CustomerService srv = CustomerService();

class CustomerController extends GetxController {
  registerCustomer(RegisterCustomerRequest request) async {
    return await srv.registerCustomer(request);
  }

  loginCustomer(LoginCustomerRequest request) async {
    return await srv.loginCustomer(request);
  }
}