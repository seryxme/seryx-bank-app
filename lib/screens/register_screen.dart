import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seryx_bank/models/customer.dart';

import '../controllers/navigation_controller.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final nav = Get.put(NavigationController());

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Register for an account',
        ),
        titleTextStyle: const TextStyle(
          fontFamily: 'Montserrat',
          color: Colors.white,
        ),
        centerTitle: true,
        actions: const [
          CircleAvatar(
            backgroundImage: AssetImage(
              'assets/images/logo-white.png',
            ),
            radius: 20,
          )
        ],
        backgroundColor: Colors.purple[700],
      ),
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                children: const [
                  SizedBox(
                    height: 30.0,
                  ),
                  RegistrationForm(),
                ],
              ),
            ),
          ),
      ),
    );
  }
}

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({Key? key}) : super(key: key);

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {

  final _formKey = GlobalKey<FormState>();
  Customer customer = Customer();
  final nav = Get.put(NavigationController());

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Container(
            alignment: Alignment.topCenter,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.topCenter,
                  width: MediaQuery.of(context).size.width / 2.58,
                  child: RegistrationFormField(
                    labelText: 'First Name\u002A',
                    hintText: 'e.g. Tunde',
                    validator: (entry) {
                      if (entry!.isEmpty) {
                        return 'Please, enter your first name.';
                      }
                      return null;
                    },
                    onSaved: (entry) {
                      customer.firstName = entry!;
                    },
                  ),
                ),
                Container(
                  alignment: Alignment.topCenter,
                  width: MediaQuery.of(context).size.width / 2.0,
                  child: RegistrationFormField(
                    labelText: 'Last Name\u002A',
                    hintText: 'e.g. Seriki',
                    validator: (entry) {
                      if (entry!.isEmpty) {
                        return 'Please, enter your last name.';
                      }
                      return null;
                    },
                    onSaved: (entry) {
                      customer.lastName = entry!;
                    },
                  ),
                ),
              ],
            ),
          ),
          RegistrationFormField(
            labelText: 'Phone Number\u002A',
            hintText: '08012345678',
            validator: (entry) {
              if (entry!.isEmpty || entry.length < 11) {
                return 'Please, enter a valid phone number.';
              }
              return null;
            },
            onSaved: (entry) {
              customer.phoneNumber = entry!;
            },
          ),
          RegistrationFormField(
            labelText: 'Email\u002A',
            hintText: 'e.g. tunde.seriki@provider.com',
            isEmail: true,
            validator: (entry) {
              if (!entry!.isEmail) {
                return 'Please, enter a valid email address.';
              }
              return null;
            },
            onSaved: (entry) {
              customer.email = entry!;
            },
          ),
          RegistrationFormField(
            labelText: 'Home Address\u002A',
            hintText: 'Full address',
            isAddress: true,
            validator: (entry) {
              if (entry!.isEmpty) {
                return 'Please, enter your home address.';
              }
              return null;
            },
            onSaved: (entry) {
              customer.email = entry!;
            },
          ),
          RegistrationFormField(
            labelText: 'Password\u002A',
            hintText: 'At least 8 characters',
            isPassword: true,
            validator: (entry) {
              if (entry!.length < 8) {
                return 'Password cannot be less than 8 characters.';
              }
              _formKey.currentState!.save();
              return null;
            },
            onSaved: (entry) {
              customer.password = entry!;
            },
          ),
          RegistrationFormField(
            labelText: 'Confirm Password\u002A',
            hintText: 'Enter password again',
            isPassword: true,
            validator: (entry) {
              if (entry!.isEmpty || entry != customer.password) {
                return 'Password mismatch.';
              }
              return null;
            },
            onSaved: (entry) {
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      nav.navigateToSuccess(customer);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple[700],
                    fixedSize: const Size(120, 40),
                  ),
                  child: const Text(
                    'Register',
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: 'Rubik',
                      fontWeight: FontWeight.bold,
                    ),
                  )
              ),
              OutlinedButton(
                  onPressed: () {
                    nav.navigateToHome();
                  },
                  style: OutlinedButton.styleFrom(
                    fixedSize: const Size(120, 40),
                  ),
                  child: const Text(
                    'Cancel',
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: 'Rubik',
                      fontWeight: FontWeight.bold,
                      color: Colors.purple,
                    ),
                  )
              ),
            ],
          )
        ],
      ),
    );
  }
}

class RegistrationFormField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final bool isEmail;
  final bool isPassword;
  final bool isAddress;
  final String? Function(String?)? validator;
  final String? Function(String?)? onSaved;
  const RegistrationFormField({
    super.key,
    required this.labelText,
    required this.hintText,
    this.isEmail = false,
    this.isPassword = false,
    this.isAddress = false,
    required this.validator,
    required this.onSaved,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.grey,
            fontStyle: FontStyle.italic,
          ),
          contentPadding: const EdgeInsets.all(10.0),
          border: InputBorder.none,
          filled: true,
          fillColor: Colors.grey[200]
        ),
        validator: validator,
        onSaved: onSaved,
        obscureText: isPassword ? true : false,
        keyboardType: isEmail ? TextInputType.emailAddress : isAddress ? TextInputType.streetAddress : TextInputType.text,
      ),
    );
  }
}

