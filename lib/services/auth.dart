
import 'package:firebase_auth/firebase_auth.dart';
import 'package:seryx_bank/dtos/requests/register_customer_request.dart';
import 'package:seryx_bank/models/customer.dart';

import '../dtos/requests/login_customer_request.dart';

class AuthenticationService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? newUser;
  User? loggedInUser;

  registerCustomer(RegisterCustomerRequest request) async {
    try {
      var res = await _auth.createUserWithEmailAndPassword(
          email: request.email,
          password: request.password
      );
      newUser = res.user;
    } catch(e) {
      print(e.toString());
    }
  }

  loginCustomer(LoginCustomerRequest request) async {
    try {
      var res = await _auth.signInWithEmailAndPassword(
          email: request.emailController.text,
          password: request.passwordController.text
      );
      loggedInUser = res.user;
    } catch(e) {
      loggedInUser = null;
      print(e.toString());
    }
  }
}