import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
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

  String? email;
  String? password;
  String? error;

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
    var user = <String, dynamic>{};
    await _db.customersCollection.get().then((e) {
      for (var doc in e.docs) {
        if (doc.id == uid) {
          user = doc.data();
        }
      }
    }
    );
    Customer foundCustomer = Mapper.mapCustomerDocToCustomer(user);
    if (foundCustomer.account.accountNum != null) {
      await _accountService.getAccountDetails(foundCustomer.account.accountNum!);
      foundCustomer.account = _accountService.foundAccount;
    }
    return foundCustomer;
  }

  addAccountToCustomer(Customer customer) async {
    await _accountService.createAccount();
    customer.account = _accountService.createdAccount;
  }

  loginCustomer(LoginCustomerRequest request) async {
    try {
      await _auth.loginCustomer(request);
      if (_auth.loggedInUser != null) {
        Customer loggedInCustomer = await getCustomerById(_auth.loggedInUser?.uid);

        if (loggedInCustomer.account.accountNum == null) {
          await addAccountToCustomer(loggedInCustomer);
          await updateCustomerAccountDetails(loggedInCustomer, _auth.loggedInUser?.uid);
        }
        return loggedInCustomer;
      }
      else {
        error = "Customer doesn't exist.";
        return null;
      }
    } catch (e) {
      print(e);
    }
  }

  updateCustomerAccountDetails(Customer customer, String? uid) async {
    var accountData = {
      'accountNum': customer.account.accountNum
    };
    await _db.customersCollection.doc(uid)
        .set(accountData, SetOptions(merge: true));
  }

  makePayment(String sender, String receiver, double amount) async {
    await _accountService.getAccountDetails(sender);
    Account senderAccount = _accountService.foundAccount;

    await _accountService.getAccountDetails(receiver);
    Account receiverAccount = _accountService.foundAccount;
    if (amount <= (senderAccount.doubleBalance)) {
      var payment = _accountService.addPaidTransaction(senderAccount, amount);
      var receipt = _accountService.addReceivedTransaction(receiverAccount, amount);
      await _accountService.addTransactionToAccount(sender, payment);
      await _accountService.addTransactionToAccount(receiver, receipt);
      return 'Payment Successful!';
    }
    else {
      error = 'Your balance is insufficient for this transfer';
      print(error);
      return error;

    }
  }
}