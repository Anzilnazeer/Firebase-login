import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_page/views/login.dart';

import 'views/home_page.dart';

class MAINPage extends StatelessWidget {
  const MAINPage({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          Future.delayed(Duration(seconds: 0));
          return HomePage();
        } else {
          Future.delayed(Duration(seconds: 0));
          return Loginpage();
        }
      },
    );
  }
}
