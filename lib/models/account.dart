import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class Account {
  String? accountId;
  String? accountNum;
  var transactions = <Transaction>[];

  String get balance {
    double totalPaid = 0.0;
    double totalReceived = 0.0;
    for (Transaction transaction in transactions) {
      totalReceived += transaction.amountReceived;
      totalPaid += transaction.amountPaid;
    }
    NumberFormat balFormat = NumberFormat("###,###,##0.00", "en_US");
    return balFormat.format(totalReceived - totalPaid);
  }

  double get doubleBalance {
    double totalPaid = 0.0;
    double totalReceived = 0.0;
    for (Transaction transaction in transactions) {
      totalReceived += transaction.amountReceived;
      totalPaid += transaction.amountPaid;
    }
    return totalReceived - totalPaid;
  }
}

class Transaction {
  double amountReceived;
  double amountPaid;
  DateTime transactionTime = DateTime.now();
  Timestamp? transactionDateRecord;

  Transaction(
      {
        required this.amountReceived,
        required this.amountPaid,
      }
  );
}
