import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Login',
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
        child: ListView(
          padding:  const EdgeInsets.symmetric(
            horizontal: 24.0,
          ),
          children: [
            const SizedBox(
              height: 80.0,
            ),
            Column(
              children: const [
                CircleAvatar(
                  backgroundImage: AssetImage(
                    'assets/images/logo-image.png',
                  ),
                  radius: 30.0,
                ),
                SizedBox(
                  height: 16.0,
                ),
                Center(
                  child: Text(
                    'SERYX BANK',
                    style: TextStyle(
                      fontFamily: 'Josefin Sans',
                      fontWeight: FontWeight.w800,
                      fontSize: 30,
                    ),
                  ),
                ),
                SizedBox(
                  height: 80.0,
                ),
              ],
            ),
             TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                labelText: 'Email',
                filled: true,
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
             TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
                filled: true,
              ),
              obscureText: true,
            ),
            OverflowBar(
              alignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: () {
                      _usernameController.clear();
                      _passwordController.clear();
                    },
                    child: const Text(
                      'Clear',
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'Rubik',
                        fontWeight: FontWeight.bold,
                        color: Colors.purple,
                      ),
                    )
                ),
                ElevatedButton(
                    onPressed: () {

                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple[700],
                    ),
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'Rubik',
                        fontWeight: FontWeight.bold,
                      ),
                    )
                ),
              ],
            )
          ],
        )
      ),
    );
  }
}
