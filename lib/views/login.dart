import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_page/firebase/auth.dart';
import 'package:login_page/views/home_page.dart';
import 'package:login_page/views/sign_up_page.dart';
import 'package:login_page/views/widgets/custom_TextField.dart';

class Loginpage extends StatelessWidget {
  Loginpage({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextField(labeltext: 'Email', controller: emailController),
            CustomTextField(
                labeltext: 'Password', controller: passwordController),
            ElevatedButton(
              onPressed: () {
                FirebaseServices.signInUsingEmailPassword(
                    email: emailController.text,
                    password: passwordController.text);
                if (user != null) {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ),
                      (route) => false);
                }
              },
              child: const Text('Login'),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Not a User ? '),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => SignUpPage(),
                    ));
                  },
                  child: const Text(
                    'Sign up',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            )
          ],
        )),
      ),
    );
  }
}
