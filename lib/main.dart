import 'package:Workit/providers/work_provider.dart';
import 'package:Workit/screens/for_edit_work.dart';
import 'package:Workit/screens/main_screen.dart';
import 'package:Workit/screens/profile_screen.dart';
import 'package:Workit/screens/user_works.dart';
import 'package:Workit/screens/work_detail_screen.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: WorkProvider()),
      ],
      child: MaterialApp(
        theme: ThemeData(primaryColor: Colors.white),
        debugShowCheckedModeBanner: false,
        home: MainScreen(),
        routes: {
          "/profile_screen": (ctx) => ProfileScreen(),
          '/work_detail_screen': (ctx) => WorkDetailScreen(),
          "/user_works": (ctx) => UserWorks(),
          "/for_edit_work": (ctx) => Editscreen(),
        },
      ),
    );
  }
}
