import 'package:flutter/material.dart';

class AppDecorations {
  static BoxDecoration get kShadowBoxDecoration => BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 5,
            spreadRadius: 1,
            color: Colors.black12,
          ),
        ],
      );
}
