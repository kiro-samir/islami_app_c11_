import 'package:flutter/material.dart';
import 'package:untitled30/home/home_screen.dart';
import 'package:untitled30/my_theme_data.dart';
import 'package:untitled30/quran/hadeth_detalis.dart';
import 'package:untitled30/quran/sura_detalis.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        SuraDetlis.routeName: (context) => SuraDetlis(),
        HadethDetlis.routeName: (context) => HadethDetlis(),
      },
      theme: MyThemeData.lightMode,
      locale: Locale(""),
    );
  }
}
