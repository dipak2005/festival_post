import 'package:festival_post/views/detail_page.dart';
import 'package:festival_post/views/download.dart';
import 'package:festival_post/views/first_screen.dart';
import 'package:festival_post/views/home_page.dart';
import 'package:festival_post/views/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatefulWidget {
  const Myapp({super.key});

  @override
  State<Myapp> createState() => _MyappState();
}

bool isdark = true;

class _MyappState extends State<Myapp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: isdark
          ? ThemeData.light(useMaterial3: true)
          : ThemeData.dark(useMaterial3: true),
      // darkTheme: ThemeData.dark(),
      initialRoute: "/",
      routes: {
        "/": (context) => Splash_screen(),
        "Home_page": (context) => Home_page(),
        "First_screen": (context) => First_screen(),
        "Detail_page": (context) => Detail_page(
              map: {},
            ),
        "Down_load":(context) =>Down_load(),
      },
    );
  }
}
