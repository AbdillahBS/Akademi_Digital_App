import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:imk_app/theme/apps_color.dart';
import 'package:imk_app/views/Home.dart';
import 'package:imk_app/views/chatbox.dart';
import 'package:imk_app/views/login.dart';
import 'package:imk_app/views/mycourse.dart';
import 'package:imk_app/views/navbar.dart';
import 'package:imk_app/views/profile.dart';
import 'package:imk_app/views/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(),
          useMaterial3: true,
          scaffoldBackgroundColor: AppColors.bg,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: '/splash',
        routes: {
          '/home': (context) => Home(),
          '/chatbox': (context) => ChatBox(),
          '/mycourse': (context) => MyCourse(),
          '/profile': (context) => Profile(),
          '/navbar': (context) => BottomNavBar(),
          '/splash': (context) => SplashScreen(),
          '/login': (context) => LoginPage(),
        },
      ),
    );
  }
}
