import 'package:bloc_base_project/presentation/views/login_view.dart';
import 'package:flutter/material.dart';

void main() => runApp(BLoCBaseProject());

class BLoCBaseProject extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginView(),
    );
  }
}
