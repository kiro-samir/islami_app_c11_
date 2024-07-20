import 'package:flutter/material.dart';
import 'package:untitled30/hadeth/hadeth_tap.dart';
import 'package:untitled30/quran/ItemhadethDetalis.dart';

import '../app_colors.dart';

class HadethDetlis extends StatefulWidget {
  static const String routeName = "hadeth_detalis";

  @override
  State<HadethDetlis> createState() => _HadethDetlisState();
}

class _HadethDetlisState extends State<HadethDetlis> {
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as Hadeth;

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
            args.title,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        body: Container(
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
              return ItemHadethDetalis(contant: args.contant[index]);
            },
            itemCount: args.contant.length,
          ),
        ),
      )
    ]);
  }
}
