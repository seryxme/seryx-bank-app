import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controllers/navigation_controller.dart';
import '../models/customer.dart';

class CustomerAccountScreen extends StatelessWidget {
  final nav = Get.put(NavigationController());
  Customer? customer;

  CustomerAccountScreen({Key? key, required this.customer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
            'Main Account   ',
            ),
            Icon(Icons.person)
          ],
        ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.purple,
              ),
                child: Text(
                  '${customer?.lastName} ${customer?.firstName}'.toUpperCase(),
                  style: const TextStyle(
                    fontSize: 12,
                    fontFamily: 'Montserrat',
                    color: Colors.white,
                  ),
                ),
            ),
            ListTile(
              title: const Text('Send funds'),
              onTap: () {
                nav.navigateToTransfer(customer!);
              },
            ),
            ListTile(
              title: const Text('Transaction History'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Sign Out'),
              onTap: () {
                customer = null;
                nav.navigateToHome();
              },
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Dashboard',
                style: TextStyle(
                  fontFamily: 'Josefin Sans',
                  fontWeight: FontWeight.normal,
                  fontSize: 25,
                ),
              ),
              const SizedBox(height: 20.0,),
              Container(
                padding: const EdgeInsets.only(left: 10.0),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  color: Colors.blueGrey,
                ),
                  width: 320.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                          'Welcome ${customer?.firstName}',
                        style: const TextStyle(
                          fontSize: 12,
                          fontFamily: 'Rubik',
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          color: Colors.deepPurple,
                        ),
                        child: const Text(
                          'Adjust account limits',
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'Rubik',
                            fontWeight: FontWeight.bold,
                            color: Colors.orange,
                          ),
                        ),
                      ),
                    ],
                  ),
              ),
              const SizedBox(height: 20.0,),
              Card(
                color: Colors.purple,
                shadowColor: Colors.purple,
                elevation: 15.0,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Image.asset(
                              'assets/images/logo-white.png',
                            width: 50.0,
                            height: 50.0,
                          ),
                          Container(
                            padding: const EdgeInsets.all(8.0),
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(20.0)),
                              color: Colors.deepPurple,
                            ),
                            child: const Text(
                              'SUPER ACCOUNT: FREE',
                              style: TextStyle(
                                fontSize: 12,
                                fontFamily: 'Rubik',
                                fontWeight: FontWeight.bold,
                                color: Colors.orange,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20,),
                      Row(
                        children: [
                          Text(
                              '${customer?.account?.balance}',
                            style: const TextStyle(
                              fontFamily: 'Josefin Sans',
                              fontWeight: FontWeight.w800,
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'A/C Name',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'Rubik',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.orange,
                                ),
                              ),
                              const SizedBox(height: 8.0,),
                              Text(
                                '${customer?.lastName} ${customer?.firstName}'.toUpperCase(),
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'Montserrat',
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          Column (
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'A/C Number',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'Rubik',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.orange,
                                ),
                              ),
                              const SizedBox(height: 8.0,),
                              Text(
                                '${customer?.account?.accountNum}',
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'Montserrat',
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
