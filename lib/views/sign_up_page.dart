import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:login_page/firebase/auth.dart';
import 'package:login_page/views/home_page.dart';

import 'widgets/custom_TextField.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          title: const Text('SignUp'),
        ),
        body: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextField(labeltext: 'Email', controller: emailController),
            CustomTextField(
                labeltext: 'Password', controller: passwordController),
            ElevatedButton(
              onPressed: () {
                FirebaseServices.registerUsingEmailPassword(
                    email: emailController.text,
                    password: passwordController.text);

                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ),
                    (route) => false);
              },
              child: const Text('Register'),
            ),
          ],
        )),
      ),
    );
  }
}
