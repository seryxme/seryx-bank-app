import 'dart:math';

import 'package:seryx_bank/services/db_service.dart';
import 'package:seryx_bank/utils/mapper.dart';

import '../models/account.dart';

class AccountService {
  final _db = DatabaseService();
  final Random _randomAccNum = Random.secure();
  var createdAccount = Account();
  var foundAccount = Account();

  createAccount() async {
    int accountNum = _randomAccNum.nextInt(3999999999);
    Account newAccount = Account();
    newAccount.accountNum = accountNum.toString().padLeft(10, '0');
    newAccount.transactions.add(Transaction(amountReceived: 10000.0, amountPaid: 0.0));
    var accountData = Mapper.mapAccountToAccountDoc(newAccount);

    await _db.accountsCollection.doc(newAccount.accountNum)
        .set(accountData);
    await addTransactionToAccount(newAccount.accountNum!, newAccount.transactions[0]);
    createdAccount = newAccount;
  }

  addTransactionToAccount(String accountNum, Transaction transaction) async {
    final transactionData = {
      'amountReceived': transaction.amountReceived,
      'amountPaid': transaction.amountPaid,
    };
    await _db.accountsCollection
        .doc(accountNum)
        .collection('transactions')
        .doc().set(transactionData);
  }

  getAccountDetails(String accountNum) async {
    var accountDoc = <String, dynamic>{};
    await _db.accountsCollection.get().then((e) {
      for (var doc in e.docs) {
        if (doc.id == accountNum) {
          accountDoc = doc.data();
        }
      }
    }
    );
    var transactions = _getTransactionDetails(accountNum);
    foundAccount = Mapper.mapAccountDocToAccount(accountDoc, transactions);
  }

  _getTransactionDetails(String accountNum) async {
    var transactionDocList = <Map<String, dynamic>>[];
    await _db.accountsCollection.doc(accountNum)
        .collection('transactions').get().then((e) {
      for (var doc in e.docs) {
        transactionDocList.add(doc.data());
      }
    }
    );
    Mapper.mapTransactionDocListToTransactionList(transactionDocList);
  }

  Transaction addPaidTransaction(Account account, double amount) {
    var payment = Transaction(
                    amountReceived: 0.0,
                    amountPaid: amount,
                  );
    account.transactions.add(payment);
    return payment;
  }

  Transaction addReceivedTransaction(Account account, double amount) {
    var receipt = Transaction(
                    amountReceived: amount,
                    amountPaid: 0.0,
                  );
    account.transactions.add(receipt);
    return receipt;
  }
}