import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:zoomplay/pages/login_page.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const LoginPage();
          } else if (ConnectionState.waiting == snapshot.connectionState) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return const LoginPage();
          }
        },
      ),
    );
  }
}
