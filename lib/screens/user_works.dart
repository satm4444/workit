import 'package:Workit/providers/work_provider.dart';
import 'package:Workit/widgets/user_work_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:provider/provider.dart';

class UserWorks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF3F3F3),
      appBar: AppBar(
        backgroundColor: Colors.green.withOpacity(0.06),
        elevation: 0,
        title: Text(
          "My Works",
          style: GoogleFonts.roboto(
            fontSize: 26,
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Consumer<WorkProvider>(builder: (ctx, works, _) {
        return ListView.builder(
          itemBuilder: (ctx, index) => UserWorkWidget(
            id: works.items[index].id,
            worktype: works.items[index].worktype,
          ),
          itemCount: works.items.length,
        );
      }),
    );
  }
}
