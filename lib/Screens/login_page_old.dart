import 'package:flutter/material.dart';
import 'package:farmbili_2/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:farmbili_2/Screens/auth/validator.dart';

final _formKey = GlobalKey<FormState>();

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double buttonheight = size.height * 0.08;
    return Scaffold(
        body: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Welcome back!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "Lexend",
                  fontWeight: FontWeight.w400,
                  fontSize: size.height * 0.05,
                ),
              ),
              SizedBox(height: size.height*0.03), //PADDING
              TextFormField(
                // controller: //for retrieving the text the user entered
                // https://flutter.dev/docs/cookbook/forms/retrieve-input
                //focusNode: //https://flutter.dev/docs/cookbook/forms/focus
                autofocus: true,
                validator: (value) => Validator.validateEmail(email: value),
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
                        fontFamily: "Lexend", fontSize: buttonheight * 0.5),
                  ),
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsets>(
                          EdgeInsets.all(10)),
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
