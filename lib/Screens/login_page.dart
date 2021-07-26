import 'package:farmbili_2/Screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:farmbili_2/constants.dart';
import 'package:farmbili_2/Screens/auth/fire_auth.dart';
import 'package:farmbili_2/Screens/auth/validator.dart';
import 'package:farmbili_2/Screens/signup_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  static final _formKey = new GlobalKey<FormState>();
  //final scaffoldKey = GlobalKey<ScaffoldState>();
  static final _emailTextController = TextEditingController();
  static final _passwordTextController = TextEditingController();
  static final _focusEmail = FocusNode();
  static final _focusPassword = FocusNode();

  bool _isProcessing = false;

  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();

    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => HomePage(user: user),
        ),
      );
    }
    return firebaseApp;
  }

  @override
  Widget build(BuildContext context) {
    /*Size size = MediaQuery.of(context).size;
    double buttonheight = size.height * 0.08;*/
    return GestureDetector(
        onTap: () {
          _focusEmail.unfocus();
          _focusPassword.unfocus();
        },
        child: Scaffold(
            body: FutureBuilder(
                future: _initializeFirebase(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 24.0, right: 24.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          /*Image.asset('assets/images/logo_withtext.png',
                              width: double.infinity,
                              height: size.height * 0.5),*/
                          // TODO: change the logo :)))
                          Form(
                            key: _formKey,
                            child: Column(
                              children: <Widget>[
                                TextFormField(
                                  controller: _emailTextController,
                                  focusNode: _focusEmail,
                                  validator: (value) =>
                                      Validator.validateEmail(email: value),
                                  decoration: InputDecoration(
                                      hintText: "Email Address",
                                      errorBorder: UnderlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(6.0),
                                        borderSide: BorderSide(
                                          color: Colors.red,
                                        ),
                                      )),
                                ),
                                SizedBox(height: 12),
                                TextFormField(
                                  controller: _passwordTextController,
                                  focusNode: _focusPassword,
                                  validator: (value) =>
                                      Validator.validatePassword(
                                          password: value),
                                  decoration: InputDecoration(
                                      hintText: "Password",
                                      errorBorder: UnderlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(6.0),
                                        borderSide: BorderSide(
                                          color: Colors.red,
                                        ),
                                      )),
                                ),
                                SizedBox(height: 20),
                                _isProcessing
                                    ? CircularProgressIndicator()
                                    : Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.stretch,
                                        children: [
                                          SizedBox(
                                              child: ElevatedButton(
                                            onPressed: () async {
                                              _focusEmail.unfocus();
                                              _focusPassword.unfocus();

                                              if (_formKey.currentState!
                                                  .validate()) {
                                                setState(() {
                                                  _isProcessing = true;
                                                });
                                                User? user = await FireAuth
                                                    .signInUsingEmailPassword(
                                                        email:
                                                            _emailTextController
                                                                .text,
                                                        password:
                                                            _passwordTextController
                                                                .text,
                                                        context: context);

                                                setState(() {
                                                  _isProcessing = false;
                                                });

                                                if (user != null) {
                                                  Navigator.of(context)
                                                      .pushReplacement(
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          HomePage(user: user),
                                                    ),
                                                  );
                                                }
                                              }
                                            },
                                            child: Text(
                                              'Log In'.toUpperCase(),
                                              style: TextStyle(
                                                  fontFamily: "Lexend",
                                                  fontSize: 24,
                                                  color: Colors.white),
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
                                          )),
                                          SizedBox(height: 12),
                                          SizedBox(
                                            child: ElevatedButton(
                                              onPressed: () {
                                                Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        SignupPage(),
                                                  ),
                                                );
                                              },
                                              child: Text(
                                                "Create Account".toUpperCase(),
                                                style: TextStyle(
                                                    color: kPrimaryColor,
                                                    fontSize: 24),
                                              ),
                                              style: ButtonStyle(
                                                  padding: MaterialStateProperty
                                                      .all<EdgeInsets>(
                                                          EdgeInsets.all(10)),
                                                  foregroundColor:
                                                      MaterialStateProperty.all<
                                                          Color>(kPrimaryColor),
                                                  backgroundColor:
                                                  MaterialStateProperty.all<
                                                      Color>(Colors.white),
                                                  shape: MaterialStateProperty
                                                      .all<RoundedRectangleBorder>(
                                                          RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            25),
                                                    side: BorderSide(
                                                        color: kPrimaryColor),
                                                  ))),
                                            ),
                                          ),
                                        ],
                                      ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                })));
  }
}
