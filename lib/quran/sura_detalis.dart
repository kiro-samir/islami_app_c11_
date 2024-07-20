import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled30/quran/ItemsuraDetalis.dart';

import '../app_colors.dart';

class SuraDetlis extends StatefulWidget {
  static const String routeName = "sura_detalis";

  @override
  State<SuraDetlis> createState() => _SuraDetlisState();
}

class _SuraDetlisState extends State<SuraDetlis> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as SuraDetailsArgs;
    if (verses.isEmpty) {
      loadFile(args.index);
    }

    return Stack(children: [
      Image.asset(
        'asstes/image/main-background.png',
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.fill,
      ),
      Scaffold(
        appBar: AppBar(
          title: Text(
            args.name,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        body: verses.isEmpty
            ? Center(child: CircularProgressIndicator())
            : Container(
                margin: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.06,
                    vertical: MediaQuery.of(context).size.height * 0.06),
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return Divider(
                      color: AppColors.primaryLightColor,
                      thickness: 2,
                    );
                  },
                  itemBuilder: (context, index) {
                    return ItemSuraDetalis(
                      contant: verses[index],
                      index: index,
                    );
                  },
                  itemCount: verses.length,
                ),
              ),
      )
    ]);
  }

  void loadFile(int index) async {
    String content =
        await rootBundle.loadString("asstes/files/${index + 1}.txt");
    List<String> lines = content.split("\n");
    for (int i = 0; i < lines.length; i++) {
      print(lines[i]);
    }
    verses = lines;
    setState(() {});
  }
}

class SuraDetailsArgs {
  String name;

  int index;

  SuraDetailsArgs({required this.name, required this.index});
}
