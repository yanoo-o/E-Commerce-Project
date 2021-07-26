import 'package:flutter/material.dart';
import 'package:farmbili_2/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double buttonheight = size.height * 0.08;
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Welcome back!',
            style: TextStyle(
              fontFamily: "Lexend",
              fontWeight: FontWeight.w400,
              fontSize: size.height * 0.05,
            ),
          ),
          SizedBox(
            width: size.width * 0.8,
            height: buttonheight,
            child: ElevatedButton(
              onPressed: () {
                print("logged in!!!");
              },
              child: Text(
                "log in".toUpperCase(),
                style: TextStyle(
                    fontFamily: "Lexend",
                    fontSize: buttonheight * 0.5
                ),
              ),
              style: ButtonStyle(
                  padding:
                      MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(10)),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(kPrimaryColor),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                    side: BorderSide(color: kPrimaryColor),
                  ))),
            ),
          ),
        ],
      ),
    ));
  }
}
