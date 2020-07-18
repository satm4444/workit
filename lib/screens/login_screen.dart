import 'package:Workit/http_exception.dart';
import 'package:Workit/providers/auth_provider.dart';
import 'package:Workit/screens/Signup_screen.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  var _isLoading = false;
  Map<String, String> _authData = {
    'email': '',
    'password': '',
  };

  void _showErrorDialog(String errorMessage) {
    showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
              title: Text('An Error Occurred!'),
              content: Text(errorMessage),
              actions: <Widget>[
                FlatButton(
                  child: Text('Okay'),
                  onPressed: () {
                    Navigator.of(ctx).pop();
                  },
                )
              ],
            ));
  }

  Future<void> _submit() async {
    if (!_formKey.currentState.validate()) {
      // Invalid!
      return;
    }
    _formKey.currentState.save();
    setState(() {
      _isLoading = true;
    });
    try {
      // Log user in
      await Provider.of<Auth>(context, listen: false)
          .login(_authData["email"], _authData["password"]);

      Navigator.pushReplacementNamed(context, '/main_screen');
    } on HttpException catch (error) {
      var errorMessage = "Authenication failed";
      if (error.toString().contains("EMAIL_EXITS")) {
        errorMessage = 'This email address is already in use.';
      } else if (error.toString().contains("INVALID_EMAIL")) {
        errorMessage = 'This is not a valid email address.';
      } else if (error.toString().contains("WEAK_PASSWORD")) {
        errorMessage = 'This password is too weak.';
      } else if (error.toString().contains("EMAIL_NOT_FOUND")) {
        errorMessage = 'Could not find a user with that email.';
      } else if (error.toString().contains("INVALID_PASSWORD")) {
        errorMessage = 'Invalid password.';
      }
      _showErrorDialog(errorMessage);
    } catch (error) {
      print(error);
      // const errorMessage =
      //     "Could not authenticate you. Please try again later!";
      // _showErrorDialog(errorMessage);
    }
    setState(() {
      _isLoading = false;
    });
  }

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
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            decoration: InputDecoration(
                                fillColor: Colors.green,
                                labelText: "Enter your email",
                                labelStyle: TextStyle(color: Colors.green),
                                hintText: "eg: abc@gmail.com"),
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value.isEmpty || !value.contains('@')) {
                                return 'Invalid email!';
                              }
                            },
                            onSaved: (value) {
                              _authData['email'] = value;
                            },
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
                            obscureText: true,
                            validator: (value) {
                              if (value.isEmpty || value.length < 5) {
                                return 'Password is too short!';
                              }
                            },
                            onSaved: (value) {
                              _authData['password'] = value;
                            },
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          if (_isLoading)
                            CircularProgressIndicator()
                          else
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
                                onPressed: _submit,
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
