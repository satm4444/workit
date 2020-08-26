import 'package:Workit/providers/work_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import 'package:provider/provider.dart';
// import 'package:url_launcher/url_launcher.dart' as ulauncher;

class WorkDetailScreen extends StatelessWidget {
//  Future<void> _makePhoneCall(String url) async {
//    if (await canLaunch(url)) {
//      await launch(url);
//    } else {
//      throw 'Could not launch $url';
//    }
//  }

  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context).settings.arguments as String;
    final fromProvider =
        Provider.of<WorkProvider>(context, listen: false).findById(data);
    // final contact = fromProvider.contact;
    var size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        //Color(0xff3C3C3C),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: 30),
              Container(
                height: 40,
                // color: Colors.yellow,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 14.0,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Text("Close",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.aBeeZee(
                              fontSize: 20,
                              color: Colors.red,
                            )
                            //color: Colors.white.withOpacity(0.8)),
                            ),
                      ),
                    ),
                    IconButton(
                        icon: Icon(Icons.share,
                            size: 22, color: Colors.black.withOpacity(0.5)),
                        onPressed: () {})
                  ],
                ),
              ),
              Container(
                height: 1, color: Colors.black.withOpacity(0.1),
                //Color(0xff444444),
              ),
              SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  width: double.infinity,
                  //  color: Colors.pink,
                  height: 520,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Work Detail",
                        textAlign: TextAlign.left,
                        style: GoogleFonts.nunitoSans(
                          fontSize: 19, color: Colors.black,
                          fontWeight: FontWeight.bold,
                          // Colors.white.withOpacity(0.8),
                        ),
                      ),
                      SizedBox(height: 30),
                      Container(
                        height: 150,
                        //color: Colors.orange,
                        width: double.infinity,
                        child: SingleChildScrollView(
                          child: Text(
                            fromProvider.workDetail,
                            textAlign: TextAlign.left,
                            style: GoogleFonts.roboto(
                              fontSize: 14,
                              color: Colors.black.withOpacity(0.6),
                              //Colors.green.withGreen(99),
                              //Color(0xffAAAAAA),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      SizedBox(height: 6),
                      Text(
                        "Posted By " + fromProvider.username,
                        style: GoogleFonts.ubuntu(
                          fontSize: 17,
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 3),
                      Text(
                        "on " +
                            DateFormat.yMMMMEEEEd()
                                .format(fromProvider.dateTime),
                        style: GoogleFonts.roboto(
                          fontSize: 14,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 3),
                      Container(
                        height: 23,
                        width: double.infinity,
                        //   color: Colors.red,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          //  crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              height: 23,
                              width: 85,
                              //  color: Colors.pink,
                              child: Text(
                                "WorkType:",
                                style: GoogleFonts.robotoSlab(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black.withOpacity(0.5)),
                              ),
                            ),
                            Container(
                              height: 23,
                              width: size.width * 0.5,
                              // color: Colors.green,
                              //   color: Colors.teal,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 2.0),
                                child: Text(
                                  fromProvider.worktype,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.lato(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 1),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        //  crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            height: 23,
                            width: 125,
                            //  color: Colors.pink,
                            child: Text(
                              "Contact Details:",
                              style: GoogleFonts.robotoSlab(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black.withOpacity(0.5)),
                            ),
                          ),
                          Container(
                            height: 23,
                            width: size.width * 0.5,
                            // color: Colors.green,
                            // color: Colors.teal,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 2.0),
                              child: Text(
                                fromProvider.contact.toString(),
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.lato(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.green,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: 25,
                        width: 300,
                        // color: Colors.blue,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Pay",
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.nunito(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: Colors.black.withOpacity(0.8),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 3.0),
                              child: Text(
                                "Rs.",
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.nunito(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black.withOpacity(0.6),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              fromProvider.pay.toStringAsFixed(0),
                              // overflow: TextOverflow.ellipsis,

                              style: GoogleFonts.ubuntu(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: Color(0xff00A871),
                              ),
                            ),
                            // SizedBox(
                            //   width: 15,
                            // ),
                          ],
                        ),
                      ),
                      Container(
                        height: 83,
                        width: 300,
                        //  color: Colors.red,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          //  crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              height: 83,
                              width: 77,
                              //  color: Colors.blue,
                              child: Text(
                                "Address:",
                                style: GoogleFonts.robotoSlab(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black.withOpacity(0.5)
                                    //Color(0xff2d2926),
                                    ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 3.5),
                              child: Container(
                                height: 83,
                                width: 220,
                                // color: Colors.green,
                                // color: Colors.teal,
                                child: SingleChildScrollView(
                                  child: Text(
                                    fromProvider.location,

                                    // overflow: TextOverflow.ellipsis,

                                    style: GoogleFonts.nunito(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black87),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 1,
                        color: Colors.black.withOpacity(0.1),
                        // Color(0xff444444),
                      ),
                      SizedBox(height: 20),
                      FlatButton.icon(
                        onPressed: () {
                          // const url = "http://google.com";
                          // if (await ulauncher.canLaunch(url)) {
                          //   await ulauncher.launch(url);
                          // } else {
                          //   throw "Could not launch $url";
                          // }
                          // print("cant launch");
                        },
                        icon: Icon(
                          CupertinoIcons.phone_solid,
                          color: Colors.white70,
                        ),
                        label: Text(
                          "Give a call",
                          style: TextStyle(
                            color: Colors.white70,
                          ),
                        ),
                        color: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
