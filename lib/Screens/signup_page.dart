import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:farmbili_2/constants.dart';
import 'package:farmbili_2/Screens/homepage.dart';
import 'package:farmbili_2/Screens/login_page.dart';
import 'package:farmbili_2/Screens/auth/fire_auth.dart';
import 'package:farmbili_2/Screens/auth/validator.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _registerFormKey = GlobalKey<FormState>();

  final _nameTextController = TextEditingController();
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  final _confirmPWTextController = TextEditingController();

  final _focusName = FocusNode();
  final _focusEmail = FocusNode();
  final _focusPassword = FocusNode();
  final _focusConfirmPW = FocusNode();

  String _userType = 'Farmer';
  String _userTypeResult = '';
  User? user = FirebaseAuth.instance.currentUser;

  bool _isProcessing = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _focusName.unfocus();
        _focusEmail.unfocus();
        _focusPassword.unfocus();
        _focusConfirmPW.unfocus();
      },
      child: Scaffold(
        //resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.all(24),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 50,),
                Form(
                    key: _registerFormKey,
                    child: Column(
                      children: <Widget>[
                        Text(
                          "Create an account".toUpperCase(),
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                            color: kPrimaryColor,
                          ),
                        ),
                        SizedBox(height: 30),
                        TextFormField(
                          controller: _nameTextController,
                          focusNode: _focusName,
                          validator: (value) => Validator.validateName(
                            name: value,
                          ),
                          decoration: InputDecoration(
                            hintText: "Name",
                            errorBorder: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: BorderSide(
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 12),
                        TextFormField(
                          controller: _emailTextController,
                          focusNode: _focusEmail,
                          validator: (value) => Validator.validateEmail(
                            email: value,
                          ),
                          decoration: InputDecoration(
                            hintText: "Email Address",
                            errorBorder: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: BorderSide(
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        TextFormField(
                          controller: _passwordTextController,
                          focusNode: _focusPassword,
                          obscureText: true,
                          validator: (value) => Validator.validatePassword(
                            password: value,
                          ),
                          decoration: InputDecoration(
                            hintText: "Password",
                            errorBorder: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(6.0),
                              borderSide: BorderSide(
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        TextFormField(
                          controller: _confirmPWTextController,
                          focusNode: _focusConfirmPW,
                          obscureText: true,
                          validator: (value) =>
                              Validator.validateConfirmPassword(
                            confirmPassword: value,
                          ),
                          decoration: InputDecoration(
                            hintText: "Confirm Password",
                            errorBorder: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(6.0),
                              borderSide: BorderSide(
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 12),
                        DropdownButton<String>(
                          hint: Text("I am a..."),
                          value: _userType,
                          items: <String>[
                            'Farmer',
                            'Customer',
                            'Sari Sari Store (FarmBili Manager)',
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              _userType = value.toString();
                            });
                          },
                        ),
                        _isProcessing
                          ? CircularProgressIndicator()
                          : Row(
                          children: [
                            Expanded(
                                child: ElevatedButton(
                                  onPressed: () async {
                                    setState(() {
                                      _isProcessing = true;
                                    });
                                    if (_registerFormKey.currentState!.validate()) {
                                      User? user = await FireAuth.registerUsingEmailPassword(
                                          name: _nameTextController.text,
                                          email: _emailTextController.text,
                                          password: _passwordTextController.text,
                                          userType: _userType);
                                    };

                                    setState(() {
                                      _isProcessing = false;
                                    });

                                    if (user != null) {
                                      Navigator.of(context).pushAndRemoveUntil(
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                HomePage(user: user!),
                                          ),
                                              ModalRoute.withName('/'),
                                      );}
                                  },
                                  child: Text(
                                    'Create Account'.toUpperCase(),
                                  ),
                                  style: ButtonStyle(
                                      padding: MaterialStateProperty
                                          .all<EdgeInsets>(
                                          EdgeInsets.all(10)),
                                      foregroundColor:
                                      MaterialStateProperty.all<
                                          Color>(Colors.white),
                                      backgroundColor:
                                      MaterialStateProperty.all<
                                          Color>(kPrimaryColor),
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(25),
                                            side: BorderSide(
                                                color: kPrimaryColor),
                                          ))),
                                )
                            ),
                          ],
                        )
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
    );
    throw UnimplementedError();
  }
}

/*class SignupPage extends StatelessWidget {
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
                'From farms straight to your home.',
                textAlign: TextAlign.center,
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
                    "create account".toUpperCase(),
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
}*/
