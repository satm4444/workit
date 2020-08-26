import 'package:Workit/providers/work_provider.dart';
import 'package:Workit/widgets/custom_search_delegate.dart';
import 'package:Workit/widgets/drawer.dart';
import 'package:Workit/widgets/list_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  Future<void> _refreshWorks(BuildContext context) async {
    await Provider.of<WorkProvider>(context, listen: false)
        .fetchAndSetWorks(false);
  }

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool _isLoading = false;

  // @override
  // void didChangeDependencies() {
  //   if (_isInit) {
  //     setState(() {
  //       _isLoading = true;
  //     });
  //     Provider.of<WorkProvider>(context, listen: false)
  //         .fetchAndSetWorks()
  //         .then((_) {
  //       setState(() {
  //         _isLoading = false;
  //       });
  //     });
  //   }

  //   _isInit = false;
  //   super.didChangeDependencies();
  // }

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: KaamChaDrawer(),
      key: _scaffoldKey,
      floatingActionButton: FloatingActionButton(
        //elevation: 2,
        splashColor: Colors.green,

        onPressed: () {
          Navigator.pushNamed(context, "/for_edit_work");
        },
        backgroundColor: Color(0xff00C484),
        child: Icon(
          Icons.add,
          size: 36,
        ),
      ),
      backgroundColor: Color(0xffF3F3F3),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
                icon: SvgPicture.asset("assets/icons/menu.svg"),
                onPressed: () {
                  _scaffoldKey.currentState.openDrawer();
                }),
          ),
          actions: <Widget>[
            IconButton(
              icon: SvgPicture.asset("assets/icons/search.svg"),
              onPressed: () {
                showSearch(context: context, delegate: CustomSearchDelegate());
              },
            ),
          ],
          elevation: 0,
          title: RichText(
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
          backgroundColor: Color(0xffF3F3F3),
          centerTitle: true,
        ),
      ),
      body: FutureBuilder(
          future: widget._refreshWorks(context),
          builder: (ctx, snapshot) {
            return snapshot.connectionState == ConnectionState.waiting
                ? Center(
                    child: CircularProgressIndicator(
                      valueColor:
                          new AlwaysStoppedAnimation<Color>(Colors.green),
                    ),
                  )
                : RefreshIndicator(
                    color: Colors.green,
                    onRefresh: () => widget._refreshWorks(context),
                    child: _isLoading
                        ? Center(
                            child: CircularProgressIndicator(
                              valueColor: new AlwaysStoppedAnimation<Color>(
                                  Colors.green),
                            ),
                          )
                        : Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                            //  color: Colors.teal,
                            child: ListBuilder(),
                          ),
                  );
          }),

      // _isLoading
      //     ? Center(
      //         child: CircularProgressIndicator(
      //           valueColor: new AlwaysStoppedAnimation<Color>(Colors.green),
      //         ),
      //       )
      //     : Container(
      //         width: MediaQuery.of(context).size.width,
      //         height: MediaQuery.of(context).size.height,
      //         //  color: Colors.teal,
      //         child: ListBuilder(),
      //       ),
    );
  }
}
