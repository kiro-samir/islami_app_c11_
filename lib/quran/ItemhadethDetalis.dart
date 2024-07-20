import 'package:flutter/material.dart';

class ItemHadethDetalis extends StatelessWidget {
  String contant;

  ItemHadethDetalis({required this.contant});

  @override
  Widget build(BuildContext context) {
    return Text(
      contant,
      textAlign: TextAlign.center,
      textDirection: TextDirection.rtl,
      style: Theme.of(context).textTheme.bodySmall,
    );
  }
}
