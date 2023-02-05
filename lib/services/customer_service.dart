import 'dart:math';

import 'package:seryx_bank/dtos/requests/register_customer_request.dart';
import 'package:seryx_bank/models/account.dart';
import 'package:seryx_bank/models/customer.dart';
import 'package:seryx_bank/services/account_service.dart';
import 'package:seryx_bank/services/db_service.dart';

import '../dtos/requests/login_customer_request.dart';
import '../dtos/responses/register_customer_response.dart';
import '../utils/mapper.dart';
import 'auth.dart';

class CustomerService {
  final _db = DatabaseService();
  final _accountService = AccountService();
  final _auth = AuthenticationService();
  final Random _randomAccNum = Random.secure();
  final Customer? _loggedInCustomer = Customer();

  String? email;
  String? password;

  registerCustomer(RegisterCustomerRequest request) async {
    await _auth.registerCustomer(request);

    await _db.customersCollection.doc(_auth.newUser?.uid)
    .set(Mapper.mapRequestToCustomerDoc(request));

    return RegisterCustomerResponse(
      firstName: request.firstName,
      lastName: request.lastName,
      message: 'your registration was successful. Please log in.'
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
    return Mapper.mapCustomerDocToCustomer(user);
  }

  addAccountToCustomer(Customer customer) {
    int accountId = _randomAccNum.nextInt(3999999999);
    Account newAccount = Account();
    newAccount.accountId = accountId;
    newAccount.accountNum = accountId.toString().padLeft(10, '0');
    customer.account = newAccount;
  }

  loginCustomer(LoginCustomerRequest request) async {
    try {
      await _auth.loginCustomer(request);
      if (_auth.loggedInUser != null) {
        return await getCustomerById(_auth.loggedInUser?.uid);
      }
      else {
        // print("Customer doesn't exist.");
        return null;
      }
    } catch (e) {
      print(e);
    }
  }
}