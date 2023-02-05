import 'dart:math';

import 'package:seryx_bank/models/account.dart';
import 'package:seryx_bank/models/customer.dart';
import 'package:seryx_bank/services/account_service.dart';
import 'package:seryx_bank/services/db_service.dart';

import 'auth.dart';

class CustomerService {
  final _db = DatabaseService();
  final _accountService = AccountService();
  final _auth = AuthenticationService();
  final Random _randomAccNum = Random.secure();
  Customer cust = Customer();
  Customer? loggedInCustomer = Customer();
  final Map<String, Customer> _customers = {};

  String? email;
  String? password;

  registerCustomer(Customer customer) async {
    await _auth.registerCustomer(customer);
    customer.customerId = _auth.newUser?.uid;

    await _db.customersCollection.doc(customer.customerId)
    .set(
      {
        'firstName': customer.firstName,
        'lastName': customer.lastName,
        'phoneNumber': customer.phoneNumber,
        'address': customer.address,
        'email': customer.email,
      }
    );
  }

  getCustomerById(String? uid) async {
    print(_db.customersCollection.count());
    var user = <String, dynamic>{};
    await _db.customersCollection.get().then((e) {
      for (var doc in e.docs) {
        if (doc.id == uid) {
          user = doc.data();
        }
      }
    }
    );
    // loggedInCustomer?.customerId = user[uid];
    // loggedInCustomer?.email = user[email];
    // loggedInCustomer?.firstName = user[firstName];

    return null;
  }

  addAccountToCustomer(Customer customer) {
    int accountId = _randomAccNum.nextInt(3999999999);
    Account newAccount = Account();
    newAccount.accountId = accountId;
    newAccount.accountNum = accountId.toString().padLeft(10, '0');
    customer.account = newAccount;
  }

  loginCustomer() async {
    try {
      await _auth.loginCustomer(email!, password!);
      if (_auth.loggedInUser != null) {
        loggedInCustomer?.email = _auth.loggedInUser?.email;
        print(loggedInCustomer?.email);
      }
      else {
        loggedInCustomer = null;
        print("Customer doesn't exist.");
      }
    } catch (e) {
      print(e);
    }

    // print(loggedInCustomer?.firstName);
  }
}