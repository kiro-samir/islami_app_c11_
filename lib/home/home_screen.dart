import 'package:flutter/material.dart';
import 'package:untitled30/hadeth/hadeth_tap.dart';
import 'package:untitled30/quran/quran_tap.dart';
import 'package:untitled30/radio/radio_tap.dart';
import 'package:untitled30/sebha/sabha_tap.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "homeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'asstes/image/main-background.png',
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
          appBar: AppBar(
            title: Text(
              "Islami",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: Theme.of(context).primaryColor,
            ),
            child: BottomNavigationBar(
              currentIndex: selectedIndex,
              onTap: (index) {
                selectedIndex = index;
                setState(() {});
              },
              items: [
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage("asstes/image/icon_quran.png")),
                    label: "quran"),
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage("asstes/image/icon_hadeth.png")),
                    label: "hadeth"),
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage("asstes/image/icon_sebha.png")),
                    label: "sebha"),
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage("asstes/image/icon_radio.png")),
                    label: "radio"),
              ],
            ),
          ),
          body: tabs[selectedIndex],
        ),
      ],
    );
  }

  List<Widget> tabs = [QuranTab(), HadethTab(), SabhaTab(), RadioTab()];
}
