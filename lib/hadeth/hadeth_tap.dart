import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled30/hadeth/ItemhadethName.dart';

import '../app_colors.dart';

class HadethTab extends StatefulWidget {
  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  List<Hadeth> ahadethList = [];

  @override
  Widget build(BuildContext context) {
    if (ahadethList.isEmpty) {
      loadHadethFile();
    }
    return Column(
      children: [
        Expanded(child: Image.asset("asstes/image/hadeth_logo.png")),
        Divider(
          color: AppColors.primaryLightColor,
          thickness: 3,
        ),
        Text("hadeth name ", style: Theme.of(context).textTheme.bodyMedium),
        Divider(
          color: AppColors.primaryLightColor,
          thickness: 3,
        ),
        Expanded(
          flex: 2,
          child: ahadethList.isEmpty
              ? CircularProgressIndicator()
              : ListView.separated(
                  separatorBuilder: (context, index) {
                    return Divider(
                      color: AppColors.primaryLightColor,
                      thickness: 2,
                    );
                  },
                  itemBuilder: (context, index) {
                    return ItemHadethName(
                      hadeth: ahadethList[index],
                    );
                  },
                  itemCount: ahadethList.length,
                ),
        ),
      ],
    );
  }

  void loadHadethFile() async {
    String hadethContant =
        await rootBundle.loadString("asstes/files/ahadeth.txt");
    List<String> hadethlist = hadethContant.split("#\r\n");
    for (int i = 0; i < hadethlist.length; i++) {
      print(hadethlist[i]);
      List<String> hadethLines = hadethlist[i].split("\n");
      String title = hadethLines[0];
      hadethLines.removeAt(0);
      Hadeth hadeth = Hadeth(title: title, contant: hadethLines);
      ahadethList.add(hadeth);
      setState(() {});
    }
  }
}

class Hadeth {
  String title;

  List<String> contant;

  Hadeth({required this.title, required this.contant});
}
