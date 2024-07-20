import 'package:flutter/material.dart';

class SabhaTab extends StatefulWidget {
  const SabhaTab({super.key});

  @override
  State<SabhaTab> createState() => _SabhaTabState();
}

class _SabhaTabState extends State<SabhaTab> {
  int counter = 0;
  double rotat = 0;
  List<String> azkar = [" sb7an allh", " saly w slam", " allh wakber"];
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Stack(
          alignment: Alignment.topCenter,
          children: [
            Image.asset("asstes/image/head_of_seb7a.png"),
            Padding(
              padding: const EdgeInsets.only(top: 75),
              child: Transform.rotate(
                  angle: rotat,
                  child: GestureDetector(
                      onTap: () {
                        onTap();
                      },
                      child: Image.asset("asstes/image/body_of_seb7a.png"))),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 27.0),
          child: Center(child: Text("count tasb7")),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 26.0),
          child: Center(
            child: Container(
              padding: EdgeInsets.all(22),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Text("$counter"),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 26.0),
          child: Center(
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Text("${azkar[index]}"),
            ),
          ),
        ),
      ],
    );
  }

  onTap() {
    counter++;
    if (counter % 34 == 0) {
      index++;
      counter++;
      counter = 0;
    }
    if (index == azkar.length) {
      index = 0;
    }
    rotat += 360 / 4;
    setState(() {});
  }
}
