import 'package:seryx_bank/dtos/requests/register_customer_request.dart';
import 'package:seryx_bank/models/customer.dart';

import '../models/account.dart';

class Mapper {

  static mapRequestToCustomerDoc(RegisterCustomerRequest request) {
    return {
      'firstName': request.firstName,
      'lastName': request.lastName,
      'phoneNumber': request.phoneNumber,
      'address': request.address,
      'email': request.email,
      'accountNum': '',
    };
  }

  static Customer mapCustomerDocToCustomer(Map<String, dynamic> user) {
    Customer customer = Customer();
    customer.email = user['email'];
    customer.firstName = user['firstName'];
    customer.lastName = user['lastName'];
    customer.address = user['address'];
    customer.phoneNumber = user['phoneNumber'];
    customer.account?.accountNum = user['accountNum'];
    return customer;
  }

  static mapAccountToAccountDoc(Account account) {
    return {
      'accountNum': account.accountNum,
    };
  }

  static mapAccountDocToAccount(Map<String, dynamic> accountDoc, transactions) {
    Account account = Account();
    account.accountNum = accountDoc['accountNum'];
    account.transactions = transactions;

    return account;
  }

  static List<Transaction> mapTransactionDocListToTransactionList(
      List<Map<String, dynamic>> transactionDocList
      ) {
    var transactions = <Transaction>[];
    for (Map<String, dynamic> doc in transactionDocList) {
      Transaction transaction = Transaction(
          amountReceived: doc['amountReceived'],
          amountPaid: doc['amountPaid']
      );
      transactions.add(transaction);
    }

    return transactions;
  }
}