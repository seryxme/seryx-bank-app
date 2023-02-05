
import 'package:firebase_auth/firebase_auth.dart';
import 'package:seryx_bank/models/customer.dart';

class AuthenticationService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? newUser;
  User? loggedInUser;

  // Customer mapUser(Customer customer) {
  //   if (newUser != null) {
  //     customer.customerId = newUser?.uid;
  //     customer.email = newUser?.email;
  //   }
  //   return customer;
  // }




  registerCustomer(Customer customer) async {
    try {
      var res = await _auth.createUserWithEmailAndPassword(
          email: customer.email!,
          password: customer.password
      );
      newUser = res.user;
    } catch(e) {
      print(e.toString());
    }
  }

  // User? get user {
  //   _auth.authStateChanges().first.then((value) => loggedInUser = value);
  //   return loggedInUser;
  // }

  loginCustomer(String email, String password) async {
    try {
      var res = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      loggedInUser = res.user;
      // print(loggedInUser?.email);
    } catch(e) {
      print(e.toString());
    }
  }
}