import 'package:get/get.dart';
import 'package:seryx_bank/dtos/requests/register_customer_request.dart';
import 'package:seryx_bank/models/customer.dart';
import 'package:seryx_bank/screens/customer_account_screen.dart';
import 'package:seryx_bank/screens/home_screen.dart';
import 'package:seryx_bank/screens/login_screen.dart';
import 'package:seryx_bank/screens/register_screen.dart';
import 'package:seryx_bank/screens/registration_success_screen.dart';

import '../dtos/responses/register_customer_response.dart';

class NavigationController extends GetxController {

  navigateToHome(){
    Get.to(() => const HomeScreen());
  }

  navigateToRegister(){
    Get.to(() => const RegisterScreen());
  }

  navigateToSuccess(RegisterCustomerResponse response){
    Get.off(() => SuccessScreen(response: response,));
  }

  navigateToCustomerAccount(Customer? customer){
    Get.to(() => CustomerAccountScreen(customer: customer,));
  }

  navigateToLogin() {
    Get.to(() => const LoginScreen());
  }
}