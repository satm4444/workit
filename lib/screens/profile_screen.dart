import 'package:Workit/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SafeArea(
                child: Container(
                  height: 40,
                  width: double.infinity,
                  // color: Colors.yellow,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      IconButton(
                          icon: Icon(CupertinoIcons.back, color: Colors.black),
                          onPressed: () {
                            Navigator.of(context).pop();
                          }),
                      Padding(
                        padding: const EdgeInsets.only(top: 3.0),
                        child: Text(
                          "My Profile",
                          style: GoogleFonts.roboto(
                            fontSize: 26,
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Divider(),
              // SizedBox(
              //   height: 10,
              // ),
              // Container(
              //   height: 12,
              //   color: Colors.black.withOpacity(0.04),
              // ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: <Widget>[
                  Container(
                    // height: deviceSize.height * 0.8,
                    width: deviceSize.width * 0.45,
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: Image.asset("assets/icons/smile.png",
                              fit: BoxFit.cover),
                          height: 198,
                          width: deviceSize.width * 0.36,
                        ),
                        Container(
                          height: 198,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: shadowList,
                          ),
                          width: deviceSize.width * 0.36,
                          child: Column(
                            children: <Widget>[
                              SizedBox(height: 10),
                              Expanded(
                                child: Container(
                                  child: Center(
                                    child: Text(
                                      "Jobs done",
                                      style: GoogleFonts.roboto(
                                        fontSize: 20,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  child: Center(
                                      child: Text(
                                    "12",
                                    style: GoogleFonts.ubuntu(
                                      fontSize: 38,
                                      color: Color(0xff138A9A),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  )),
                                ),
                              ),
                              SizedBox(height: 10),
                              Expanded(
                                child: Container(
                                  child: Center(
                                      child: Text(
                                    "Jobs Given",
                                    style: GoogleFonts.roboto(
                                      fontSize: 20,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  )),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  child: Center(
                                      child: Text(
                                    "30",
                                    style: GoogleFonts.ubuntu(
                                      fontSize: 38,
                                      color: Color(0xff138A9A),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  )),
                                ),
                              ),
                              SizedBox(height: 20),
                            ],
                          ),
                        ),
                        SizedBox(height: 15),
                        Container(
                          height: 130,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: shadowList,
                          ),
                          width: deviceSize.width * 0.36,
                          child: Column(
                            children: <Widget>[
                              SizedBox(height: 20),
                              Container(
                                height: 60,
                                //  color: Colors.red,
                                child: SvgPicture.asset(
                                    "assets/icons/placeholder.svg"),
                              ),
                              Container(
                                height: 40,
                                // color: Colors.red,
                                child: Center(
                                  child: Text(
                                    "My Location",
                                    style: GoogleFonts.ubuntu(
                                      fontSize: 17,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                            ],
                          ),
                        ),
                        SizedBox(height: 15),
                        Container(
                          height: 30,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: shadowList,
                          ),
                          width: deviceSize.width * 0.36,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: deviceSize.width * 0.55,
                    // height: 816,
                    //color: Colors.green,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                "Done Saho",
                                style: GoogleFonts.roboto(
                                    fontSize: 21, fontWeight: FontWeight.bold),
                              ),
                            ),
                            // color: Colors.white,
                          ),
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                "rawalsatyam018@gmail.com",
                                style: GoogleFonts.ubuntu(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black.withOpacity(0.5)),
                              ),
                            ),
                            //color: Colors.white,
                          ),
                          SizedBox(height: 20),
                          MaterialButton(
                              color: Colors.white,
                              height: 56,
                              elevation: 1,
                              child: Text(
                                "Go to My jobs >",
                                style: GoogleFonts.notoSans(
                                  shadows: <Shadow>[
                                    Shadow(
                                        offset: Offset(0, 1),
                                        blurRadius: 1.0,
                                        color: Colors.blue),
                                  ],
                                  fontSize: 19,
                                  color: Color(0xff3579D5),
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              minWidth: deviceSize.width * 0.55,
                              onPressed: () {}),
                          SizedBox(height: 20),
                          Container(
                            height: 190,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: shadowList,
                            ),
                            width: deviceSize.width * 0.55,
                            child: Column(
                              children: <Widget>[
                                Container(
                                  height: 70,
                                  width: deviceSize.width * 0.55,
                                  //  color: Colors.teal,
                                  child: Center(
                                    child: Text(
                                      "My Cash",
                                      style: GoogleFonts.titilliumWeb(
                                        fontSize: 32,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 40,
                                  width: deviceSize.width * 0.55,
                                  // color: Colors.red,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        "Rs.",
                                        style: GoogleFonts.nunito(
                                          fontSize: 20,
                                          color: Colors.black.withOpacity(0.6),
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      SizedBox(width: 5),
                                      Flexible(
                                        child: Text(
                                          "0/-",
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.robotoMono(
                                            fontSize: 30,
                                            color: Color(0xff139A2E),
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 80,
                                  width: deviceSize.width * 0.55,
                                  //  color: Colors.green,
                                  child: Center(
                                    child: FlatButton.icon(
                                        color: Color(0xffE30045),
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.add,
                                          color: Colors.white,
                                        ),
                                        label: Text(
                                          "add Cash",
                                          style: GoogleFonts.nunito(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.white,
                                          ),
                                        )),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 20),
                          Container(
                            height: 165,
                            width: deviceSize.width * 0.55,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: shadowList,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                //   mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Expanded(
                                    child: Text(
                                      "Our Services",
                                      style: GoogleFonts.roboto(
                                        fontSize: 17,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      "Accounts Settings",
                                      style: GoogleFonts.roboto(
                                        fontSize: 17,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      "Privacy Policies",
                                      style: GoogleFonts.roboto(
                                        fontSize: 17,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      "Help",
                                      style: GoogleFonts.roboto(
                                        fontSize: 17,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: FlatButton(
                                      padding: EdgeInsets.only(right: 33),
                                      onPressed: () {},
                                      child: Text(
                                        "Logout",
                                        style: GoogleFonts.roboto(
                                          fontSize: 17,
                                          color: Colors.red,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Container(
                            height: 30,
                            width: deviceSize.width * 0.55,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                RichText(
                                  text: TextSpan(
                                    //style: TextStyle(color: Colors.black, fontSize: 36),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: 'Work',
                                          style: GoogleFonts.rubik(
                                            color: Color(0xff00C484),
                                            fontSize: 27,
                                            //  letterSpacing: 2,
                                            //  fontFamily: "Menlo",
                                            fontWeight: FontWeight.w600,
                                          )),
                                      TextSpan(
                                        text: 'it',
                                        style: GoogleFonts.ubuntu(
                                          textStyle: TextStyle(
                                            color: Color(0xff2F2F2F),
                                            fontSize: 27,
                                            //letterSpacing: 2,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
