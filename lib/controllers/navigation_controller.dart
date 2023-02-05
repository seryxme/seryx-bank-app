import 'package:get/get.dart';
import 'package:seryx_bank/models/customer.dart';
import 'package:seryx_bank/screens/customer_account_screen.dart';
import 'package:seryx_bank/screens/home_screen.dart';
import 'package:seryx_bank/screens/login_screen.dart';
import 'package:seryx_bank/screens/register_screen.dart';
import 'package:seryx_bank/screens/registration_success_screen.dart';

class NavigationController extends GetxController {

  navigateToHome(){
    Get.to(() => const HomeScreen());
  }

  navigateToRegister(){
    Get.to(() => const RegisterScreen());
  }

  navigateToSuccess(Customer customer){
    Get.off(() => SuccessScreen(customer: customer,));
  }

  navigateToCustomerAccount(Customer? customer){
    Get.to(() => CustomerAccountScreen(customer: customer,));
  }

  navigateToLogin() {
    Get.to(() => const LoginScreen());
  }
}