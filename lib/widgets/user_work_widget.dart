import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserWorkWidget extends StatelessWidget {
  final String id;
  final String worktype;

  const UserWorkWidget({this.id, this.worktype});

  @override
  Widget build(BuildContext context) {
    // var deviceSize = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        SizedBox(height: 10),
        ListTile(
          title: Text(
            worktype,
            style: GoogleFonts.raleway(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: Color(0xff2F2F2F),
            ),
          ),
          leading: CircleAvatar(
            backgroundImage: AssetImage("assets/icons/workprofile.png"),
          ),
          trailing: Container(
            decoration: BoxDecoration(
              color: //Colors.green.withOpacity(0.2),
                  Colors.red.withOpacity(0.06),
              borderRadius: BorderRadius.circular(8),
            ),
            width: 100,
            child: Row(
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    CupertinoIcons.pen,
                    color: Colors.black.withOpacity(0.5),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      '/for_edit_work',
                      arguments: id,
                    );
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.delete,
                    //CupertinoIcons.delete,
                    color: Colors.red,
                  ),
                  onPressed: () {},
                )
              ],
            ),
          ),
        ),
        Divider(),
      ],
    );
  }
}
