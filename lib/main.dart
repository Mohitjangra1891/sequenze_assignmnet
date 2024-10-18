import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sequenze_assignmnet/web_frame/web_frame.dart';

import 'features/login/loginscreen.dart';

const kPrimaryColor = Color(0xFFB65A38);

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.white,
    ),
  );
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return FlutterWebFrame(
        maximumSize: Size(500.0, 780.0),
        enabled: kIsWeb,
        builder: (context) {
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              // brightness: Brightness.dark,
              primaryColor: kPrimaryColor,
              textTheme: GoogleFonts.interTextTheme(textTheme).copyWith(),

              // scaffoldBackgroundColor: Colors.transparent,
              inputDecorationTheme: InputDecorationTheme(
                filled: true,
                fillColor: Colors.white24,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
              useMaterial3: true,
            ),
            // theme: customTheme(),

            home: login_screen(),
          );
        });
  }
}

