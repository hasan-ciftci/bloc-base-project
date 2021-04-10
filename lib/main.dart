import 'package:bloc_base_project/view/login/login_view.dart';
import 'package:flutter/material.dart';

void main() => runApp(BLoCBaseProject());

class BLoCBaseProject extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginView(),
    );
  }
}
