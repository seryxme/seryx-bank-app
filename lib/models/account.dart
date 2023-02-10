class Account {
  String? accountId;
  String? accountNum;
  var transactions = <Transaction>[];

  String? get balance {
    double totalPaid = 0.00;
    double totalReceived = 0.00;
    for (Transaction transaction in transactions) {
      totalReceived += transaction.amountReceived;
      totalPaid += transaction.amountPaid;
    }
    // NumberFormat format = NumberFormat();
    return (totalReceived - totalPaid).toStringAsFixed(2);
  }
}

class Transaction {
  double amountReceived = 0.0;
  double amountPaid = 0.0;
  DateTime transactionTime = DateTime.now();

  Transaction(
      {
        required this.amountReceived,
        required this.amountPaid,
      }
  );
}
