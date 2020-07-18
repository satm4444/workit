import 'package:Workit/providers/auth_provider.dart';
import 'package:Workit/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class KaamChaDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: RichText(
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
                    ),
                  ),
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
          ),
          //  Divider(),
          ListTile(
            trailing: Icon(
              Icons.person,
              color: Colors.redAccent,
            ),
            title: Text(
              'My Profile',
              style: GoogleFonts.roboto(
                color: Colors.black87,
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/profile_screen');
            },
          ),
          // Divider(),
          ListTile(
            trailing: Icon(
              Icons.work,
              color: Colors.green,
            ),
            title: Text(
              'My Works',
              style: GoogleFonts.roboto(
                color: Colors.black87,
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/user_works');
            },
          ),
          // Divider(),
          ListTile(
            trailing: Icon(
              Icons.add,
              color: Colors.orange,
            ),
            title: Text(
              'Add Work',
              style: GoogleFonts.roboto(
                color: Colors.black87,
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/user_pr_screen');
            },
          ),

          ListTile(
            trailing: Icon(
              Icons.live_help,
              color: Colors.blue,
            ),
            title: Text(
              'Help & Feedback',
              style: GoogleFonts.roboto(
                color: Colors.black87,
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          //  Divider(),
          Divider(),
          ListTile(
            title: Text(
              'Logout',
              style: GoogleFonts.roboto(
                color: Colors.red,
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            ),
            onTap: () async {
              Navigator.of(context).pop();
              await Provider.of<Auth>(context, listen: false).logout();
              Navigator.pushReplacementNamed(context, '/welcome_screen');
            },
          ),
        ],
      ),
    );
  }
}
