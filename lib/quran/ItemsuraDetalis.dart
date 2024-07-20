import 'package:flutter/material.dart';

class ItemSuraDetalis extends StatelessWidget {
  String contant;

  int index;

  ItemSuraDetalis({required this.contant, required this.index});

  @override
  Widget build(BuildContext context) {
    return Text(
      "$contant (${index + 1})",
      textAlign: TextAlign.center,
      textDirection: TextDirection.rtl,
      style: Theme.of(context).textTheme.bodySmall,
    );
  }
}
