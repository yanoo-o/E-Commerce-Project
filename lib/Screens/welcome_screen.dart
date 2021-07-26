import 'package:farmbili_2/Screens/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:farmbili_2/constants.dart';
import 'package:farmbili_2/Screens/login_page.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double buttonheight = size.height * 0.08;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
/*          Text(
            'Welcome!',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: size.height * 0.05,
            ),
          ),*/
          Image.asset('assets/images/logo_withtext.png',
              width: double.infinity, height: size.height * 0.5),
          SizedBox(height: size.height*0.03), //PADDING
          SizedBox(
            width: size.width * 0.8,
            height: buttonheight,
            child: ElevatedButton(
              onPressed: () {
                print("log in daw");
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage())
                );
              },
              child: Text(
                "log in".toUpperCase(),
                style: TextStyle(
                    fontFamily: "Lexend",
                    fontSize: buttonheight * 0.5,
                    fontWeight: FontWeight.w600,
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
          SizedBox(height: size.height*0.03), //PADDING
          SizedBox(
            width: size.width * 0.8,
            height: buttonheight,
            child: TextButton(
              onPressed: () {
                print("create account daw");
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignupPage())
                );
              },
              child: Text("create account".toUpperCase(),
                  style: TextStyle(
                    fontFamily: "Lexend",
                    fontSize: buttonheight * 0.5,
                    color: kPrimaryColor,
                    fontWeight: FontWeight.w600,
                  )),
              style: ButtonStyle(
                  padding:
                      MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(10)),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(kPrimaryColor),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                    side: BorderSide(color: kPrimaryColor),
                  ))),
            ),
          )
        ],
      ),
    );
  }
}
