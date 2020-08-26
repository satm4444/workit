import 'package:Workit/screens/Signup_screen.dart';
import 'package:Workit/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      //backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Container(
            height: deviceSize.height,
            width: deviceSize.width,
            child: Image.asset(
              "assets/icons/back.jpg",
              fit: BoxFit.cover,
            ),
          ),
          Container(
            height: deviceSize.height,
            width: deviceSize.width,
            color: Colors.white.withOpacity(0.8),
          ),
          Column(
            children: <Widget>[
              Container(
                height: deviceSize.height * 0.6,
                width: deviceSize.width,
                // color: Colors.green,
                child: Center(
                  child: RichText(
                    text: TextSpan(
                      //style: TextStyle(color: Colors.black, fontSize: 36),
                      children: <TextSpan>[
                        TextSpan(
                            text: 'Work',
                            style: GoogleFonts.rubik(
                              color: Color(0xff00C484),
                              fontSize: deviceSize.width * 0.2,
                              //  letterSpacing: 2,
                              //  fontFamily: "Menlo",
                              fontWeight: FontWeight.w600,
                            )),
                        TextSpan(
                          text: 'it',
                          style: GoogleFonts.ubuntu(
                            textStyle: TextStyle(
                              color: Color(0xff2F2F2F),
                              fontSize: deviceSize.width * 0.2,
                              //letterSpacing: 2,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                height: deviceSize.height * 0.4,
                width: deviceSize.width,
                //   color: Colors.red,
                child: Column(
                  children: <Widget>[
                    Container(
                      height: deviceSize.height * 0.08,
                      width: deviceSize.width * 0.8,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()));
                        },
                        child: Text(
                          "Login",
                          style: GoogleFonts.nunito(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: deviceSize.height * 0.015),
                    Container(
                      height: deviceSize.height * 0.08,
                      width: deviceSize.width * 0.8,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignupScreen()));
                        },
                        child: Text(
                          "Signup",
                          style: GoogleFonts.nunito(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: deviceSize.height * 0.015),
                    Text(
                      "By using Workit, you agree to Workit's",
                      style: GoogleFonts.roboto(
                        fontSize: 13,
                        color: Colors.black.withOpacity(0.5),
                      ),
                    ),
                    RichText(
                      text: TextSpan(children: <TextSpan>[
                        TextSpan(
                          text: "Terms of Use ",
                          style: GoogleFonts.roboto(
                            decoration: TextDecoration.underline,
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextSpan(
                          text: "& ",
                          style: GoogleFonts.roboto(
                            fontSize: 13,
                            color: Colors.black.withOpacity(0.5),
                          ),
                        ),
                        TextSpan(
                          text: "Privacy Policy",
                          style: GoogleFonts.roboto(
                            decoration: TextDecoration.underline,
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ]),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
