import 'package:Workit/models/work.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:timeago/timeago.dart' as timeago;
//import 'package:jiffy/jiffy.dart';

import 'package:provider/provider.dart';

class BigCard extends StatefulWidget {
  @override
  _BigCardState createState() => _BigCardState();
}

class _BigCardState extends State<BigCard> {
  @override
  Widget build(BuildContext context) {
    final fromModel = Provider.of<Work>(context, listen: false);

    var mediaWidth = MediaQuery.of(context).size.width;

    final now = new DateTime.now();
    final difference = now.difference(fromModel.dateTime);
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/work_detail_screen',
            arguments: fromModel.id);
      },
      child: Padding(
        padding:
            const EdgeInsets.only(top: 12.0, left: 9, right: 9, bottom: 12),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            color: Colors.white,
            height: 260,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 70,
                  width: mediaWidth,
                  // color: Colors.green,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Row(
                          children: <Widget>[
                            CircleAvatar(
                              backgroundImage: AssetImage(
                                "assets/icons/workprofile.png",
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  fromModel.worktype,
                                  style: GoogleFonts.raleway(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xff2F2F2F),
                                  ),
                                ),
                                Text("By " + fromModel.username,
                                    //timeago.format(fromModel.dateTime),
                                    //Jiffy(fromModel.dateTime).fromNow(),

                                    style: GoogleFonts.ubuntu(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.green.withGreen(99),
                                    )
                                    // color: Colors.black.withOpacity(0.3)),
                                    ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 12.0),
                        child: Text(timeago.format(now.subtract(difference)),
                            //timeago.format(fromModel.dateTime),
                            //Jiffy(fromModel.dateTime).fromNow(),

                            style: GoogleFonts.ubuntu(
                              fontSize: 11,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff847676),
                              // backgroundColor: Colors.pink.withOpacity(0.01)
                              // color: Color(0xff847676),
                            )
                            // color: Colors.black.withOpacity(0.3)),
                            ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 60,
                  width: mediaWidth,
                  //   color: Colors.blue,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 60,
                        width: 50,
                        //    color: Colors.pink,
                        child: Text(
                          "Work:",
                          style: GoogleFonts.robotoSlab(
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                            color: Color(0xff00C484),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 3.5),
                        child: Container(
                          height: 60,
                          width: mediaWidth * 0.76,
                          //color: Colors.teal,
                          child: Text(
                            fromModel.workDetail,
                            //   "Cleaning of the room, also picking up some heavy stuffs back to the garage stuffs back to the garage stuffs back to the garage.",
                            maxLines: 3,
                            textAlign: TextAlign.justify,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.roboto(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: Colors.black.withOpacity(0.75)
                                //Color(0xff2d2926),
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 30,
                  width: mediaWidth,
                  // color: Colors.amber,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 3),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      //  crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          height: 30,
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
                        Padding(
                          padding: const EdgeInsets.only(top: 1.0),
                          child: Container(
                            height: 30,
                            width: mediaWidth * 0.5,
                            // color: Colors.green,
                            // color: Colors.teal,
                            child: Text(fromModel.contact,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.lato(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xffE30045),
                                )),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 30,
                  width: mediaWidth,
                  //  color: Colors.pink,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    //  crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 30,
                        width: 77,
                        //  color: Colors.pink,
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
                        padding: const EdgeInsets.only(top: 1.5),
                        child: Container(
                          height: 30,
                          width: mediaWidth * 0.65,
                          //     color: Colors.green,
                          //  color: Colors.teal,
                          child: Text(
                            fromModel.location,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.nunito(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: Color(0xffE30045),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 7,
                  width: mediaWidth,
                  color: Color(0xffF3F3F3),
                ),
                Container(
                    height: 63,
                    width: mediaWidth,
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          height: 63,
                          width: (mediaWidth - 18) / 2,
                          //   color: Colors.red,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                width: 15,
                              ),
                              Container(
                                height: 33,
                                width: 33,
                                child: fromModel.isActive
                                    ? SvgPicture.asset("assets/icons/tick.svg")
                                    : SvgPicture.asset(
                                        "assets/icons/close.svg"),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                fromModel.isActive ? "Active" : "Closed",
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.nunito(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black.withOpacity(0.6),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 63,
                          width: (mediaWidth - 18) / 2,
                          //  color: Colors.blue,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
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
                                fromModel.pay.toStringAsFixed(0),
                                // overflow: TextOverflow.ellipsis,

                                style: GoogleFonts.ubuntu(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xff00A871),
                                ),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                            ],
                          ),
                        ),
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
