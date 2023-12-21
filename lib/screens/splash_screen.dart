import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:public_chats/api/apis.dart';
import 'package:public_chats/main.dart';
import 'package:public_chats/screens/home_screen.dart';
import 'package:public_chats/auth/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
      SystemChrome.setSystemUIOverlayStyle(
          const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
      if (APIs.auth.currentUser != null) {
        log("\nUser: ${APIs.auth.currentUser}");
        log("\nUserAdditionalInfo: ${FirebaseAuth.instance.currentUser}");
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) {
              return const HomeScreen();
            },
          ),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) {
              return const LoginScreen();
            },
          ),
        );
      }
    });
  }

  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Welcome to Public chat'),
      ),
      body: Stack(
        children: [
          Positioned(
              top: mq.height * .15,
              right: mq.width * .25,
              width: mq.width * .5,
              child: Image.asset('assets/images/icon.png')),
          Positioned(
            bottom: mq.height * .15,
            width: mq.width,
            child: const Text(
              "Made in INDIA with ❤️ ",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20, color: Colors.black54, letterSpacing: .5),
            ),
          ),
        ],
      ),
    );
  }
}
