import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final String labelText;
  final bool isObscure;

  const CustomTextFormField({
    Key key,
    @required this.hintText,
    @required this.labelText,
    this.isObscure,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isObscure ?? false,
      decoration: InputDecoration(
        alignLabelWithHint: true,
        labelText: labelText,
        hintText: hintText,
      ),
    );
  }
}
