import 'package:seryx_bank/dtos/requests/register_customer_request.dart';
import 'package:seryx_bank/models/customer.dart';

class Mapper {

  static mapRequestToCustomerDoc(RegisterCustomerRequest request) {
    return {
      'firstName': request.firstName,
      'lastName': request.lastName,
      'phoneNumber': request.phoneNumber,
      'address': request.address,
      'email': request.email,
    };
  }

  static Customer mapCustomerDocToCustomer(Map<String, dynamic> user) {
    Customer customer = Customer();
    customer.email = user['email'];
    customer.firstName = user['firstName'];
    customer.lastName = user['lastName'];
    customer.address = user['address'];
    customer.phoneNumber = user['phoneNumber'];

    return customer;
  }
}