import 'package:seryx_bank/models/account.dart';

class Customer {
  String? customerId;
  String? firstName = '';
  String lastName = '';
  String phoneNumber = '';
  String address = '';
  String? email;
  Account account = Account();
  String? transactionPin;
}