import 'package:Workit/providers/auth_provider.dart';
import 'package:Workit/providers/work_provider.dart';
import 'package:Workit/screens/for_edit_work.dart';

import 'package:Workit/screens/login_screen.dart';
import 'package:Workit/screens/main_screen.dart';
import 'package:Workit/screens/profile_screen.dart';
import 'package:Workit/screens/user_works.dart';
import 'package:Workit/screens/welcome_screen.dart';
import 'package:Workit/screens/work_detail_screen.dart';
import 'package:flare_splash_screen/flare_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StyledToast(
      locale: const Locale('en', 'US'),

      ///You have to set this parameters to your locale
      textStyle: TextStyle(fontSize: 16.0, color: Colors.white),

      borderRadius: BorderRadius.circular(5.0),
      textPadding: EdgeInsets.symmetric(horizontal: 17.0, vertical: 10.0),
      toastAnimation: StyledToastAnimation.size,
      reverseAnimation: StyledToastAnimation.size,
      startOffset: Offset(0.0, -1.0),
      reverseEndOffset: Offset(0.0, -1.0),
      duration: Duration(seconds: 4),
      animDuration: Duration(seconds: 1),
      alignment: Alignment.center,
      toastPositions: StyledToastPosition.center,
      curve: Curves.fastOutSlowIn,
      reverseCurve: Curves.fastOutSlowIn,
      dismissOtherOnShow: true,
      movingOnWindowChange: true,

      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => Auth()),
          ChangeNotifierProxyProvider<Auth, WorkProvider>(
            update:
                (BuildContext context, Auth auth, WorkProvider previousWorks) {
              return WorkProvider(auth.token, auth.userId,
                  previousWorks == null ? [] : previousWorks.items);
            },
          ),
        ],
        child: MaterialApp(
          theme: ThemeData(primaryColor: Colors.white),
          debugShowCheckedModeBanner: false,
          home: SplashBetween(),
          routes: {
            '/main_screen': (ctx) => MainScreen(),
            "/profile_screen": (ctx) => ProfileScreen(),
            '/login_screen': (ctx) => LoginScreen(),
            '/welcome_screen': (ctx) => WelcomeScreen(),
            '/work_detail_screen': (ctx) => WorkDetailScreen(),
            "/user_works": (ctx) => UserWorks(),
            "/for_edit_work": (ctx) => Editscreen(),
          },
        ),
      ),
    );
  }
}

class SplashBetween extends StatefulWidget {
  @override
  _SplashBetweenState createState() => _SplashBetweenState();
}

class _SplashBetweenState extends State<SplashBetween> {
  bool isInit = true;
  bool isLogin = false;

  // @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (isInit) {
      checkLogin();
    }
    isInit = false;
  }

  void checkLogin() async {
    isLogin = await Provider.of<Auth>(context).tryAutoLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SplashScreen.navigate(
      name: "assets/images/Splash.flr",
      fit: BoxFit.cover,
      backgroundColor: Colors.white,
      // transitionsBuilder: (ctx, animation, second, child) {
      //   var begin = Offset(1.0, 0.0);
      //   var end = Offset.zero;
      //   var tween = Tween(begin: begin, end: end)
      //       .chain(CurveTween(curve: Curves.easeIn));
      //   var offsetAnimation = animation.drive(tween);

      //   return SlideTransition(
      //     position: offsetAnimation,
      //     child: child,
      //   );
      // },
      startAnimation: "Untitled",
      //loopAnimation: "Untitled",
      until: () => Future.delayed(Duration(seconds: 3)),
      alignment: Alignment.center,
      next: (_) => isLogin ? MainScreen() : WelcomeScreen(),
      //WelcomeScreen(),
    ));
  }
}
