import 'package:Workit/screens/Signup_screen.dart';
import 'package:Workit/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Container(
              height: deviceSize.height,
              width: deviceSize.width,
              child: Image.asset("assets/icons/back.jpg"),
            ),
            Container(
              height: deviceSize.height,
              width: deviceSize.width,
              color: Colors.white.withOpacity(0.8),
            ),
            Column(
              children: <Widget>[
                Container(
                  height: deviceSize.height * 0.35,
                  width: deviceSize.width,
                  //  color: Colors.green,
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
                    height: deviceSize.height * 0.65,
                    width: deviceSize.width,
                    //   color: Colors.red,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Form(
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            decoration: InputDecoration(
                                fillColor: Colors.green,
                                labelText: "Enter your email",
                                labelStyle: TextStyle(color: Colors.green),
                                hintText: "eg: abc@gmail.com"),
                            keyboardType: TextInputType.emailAddress,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              fillColor: Colors.green,
                              labelText: "Enter your password",
                              labelStyle: TextStyle(color: Colors.green),
                            ),
                            keyboardType: TextInputType.emailAddress,
                            obscureText: true,
                          ),
                          SizedBox(
                            height: 50,
                          ),
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
                                        builder: (context) => MainScreen()));
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
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Not a member?",
                            style: GoogleFonts.roboto(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: Colors.black.withOpacity(0.5),
                            ),
                          ),
                          FlatButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignupScreen()));
                            },
                            child: Text(
                              "SignUp",
                              style: GoogleFonts.nunito(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.teal,
                              ),
                            ),
                          )
                        ],
                      ),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
