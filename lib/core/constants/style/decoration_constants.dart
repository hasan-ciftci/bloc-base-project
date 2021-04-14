import 'package:flutter/material.dart';

class AppDecorations {
  static BoxDecoration kShadowBoxDecoration(context) => BoxDecoration(
        color: Theme.of(context).bottomAppBarColor,
        boxShadow: [
          BoxShadow(
              blurRadius: 5,
              spreadRadius: 1,
              color:
                  Theme.of(context).textTheme.bodyText1.color.withOpacity(0.5)),
        ],
      );
}
