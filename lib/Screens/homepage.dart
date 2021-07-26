import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:farmbili_2/constants.dart';
import 'package:farmbili_2/Screens/welcome_screen.dart';
import 'package:farmbili_2/Screens/login_page.dart';
import 'package:farmbili_2/Screens/homepage.dart';

class HomePage extends StatefulWidget {
  final User user;
  const HomePage({required this.user});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  bool _isSendingVerification = false;
  bool _isSigningOut = false;

  late User _currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('nsmdanmsa'),
            //https://github.com/sbis04/flutter-authentication/blob/master/lib/screens/profile_page.dart
          ],
        ),
      ),
    );
  }
}

