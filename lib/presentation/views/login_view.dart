import 'package:bloc_base_project/core/constants/image/image_constants.dart';
import 'package:bloc_base_project/core/constants/style/decoration_constants.dart';
import 'package:bloc_base_project/presentation/widgets/custom_text_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          double verticalMargin = constraints.maxHeight * .10;
          double horizontalMargin = constraints.maxWidth * .05;
          return Container(
            decoration: AppDecorations.kShadowBoxDecoration,
            margin: EdgeInsets.symmetric(
              vertical: verticalMargin,
              horizontal: horizontalMargin,
            ),
            padding: EdgeInsets.symmetric(
              vertical: verticalMargin,
              horizontal: horizontalMargin,
            ),
            child: buildLoginForm(),
          );
        },
      ),
    );
  }

  Form buildLoginForm() {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          buildLogo(assetPath: ImageConstants.instance.logo),
          buildUsernameFormField(),
          buildPasswordFormField(),
          buildLoginButton()
        ],
      ),
    );
  }

  Flexible buildLogo({@required String assetPath}) =>
      Flexible(child: Image.asset(assetPath));

  CustomTextFormField buildUsernameFormField() {
    return CustomTextFormField(
      hintText: 'Kullanıcı Adı',
      labelText: 'Kullanıcı Adı',
    );
  }

  CustomTextFormField buildPasswordFormField() {
    return CustomTextFormField(
      isObscure: true,
      hintText: 'Parola',
      labelText: 'Parola',
    );
  }

  ElevatedButton buildLoginButton() =>
      ElevatedButton(onPressed: () {}, child: Text("Giriş yap"));
}
