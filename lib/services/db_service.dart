import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final customersCollection = FirebaseFirestore.instance.collection("customers");

  final accountsCollection = FirebaseFirestore.instance.collection("accounts");

}