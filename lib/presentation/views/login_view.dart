import 'package:bloc_base_project/core/constants/image/image_constants.dart';
import 'package:bloc_base_project/core/constants/navigation/navigation_constants.dart';
import 'package:bloc_base_project/core/constants/style/decoration_constants.dart';
import 'package:bloc_base_project/core/init/lang/locale_keys.g.dart';
import 'package:bloc_base_project/core/init/navigation/navigation_service.dart';
import 'package:bloc_base_project/data/repositories/authentication_repository.dart';
import 'package:bloc_base_project/presentation/blocs/form_submission_status.dart';
import 'package:bloc_base_project/presentation/blocs/login/login_bloc.dart';
import 'package:bloc_base_project/presentation/blocs/login/login_event.dart';
import 'package:bloc_base_project/presentation/blocs/login/login_state.dart';
import 'package:bloc_base_project/presentation/widgets/locale_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatelessWidget {
  final _loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => AuthenticationRepository(),
      child: BlocProvider(
        create: (context) => LoginBloc(
            authenticationRepository: context.read<AuthenticationRepository>()),
        child: Scaffold(
          body: SafeArea(
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                double verticalMargin = constraints.maxHeight * .10;
                double horizontalMargin = constraints.maxWidth * .05;
                return Center(
                  child: SingleChildScrollView(
                      reverse: true,
                      child: Container(
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
                      )),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget buildLoginForm() {
    return BlocListener<LoginBloc, LoginState>(
      listener: (BuildContext context, state) {
        final formStatus = state.formStatus;
        if (formStatus is SubmissionFailed) {
          //TODO: WAITING FOR IMPLEMENTATION
        }
        if (formStatus is SubmissionSuccess) {
          NavigationService.instance
              .navigateToPageClear(path: NavigationConstants.HOME_VIEW);
        }
      },
      child: Form(
        key: _loginFormKey,
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
      ),
    );
  }

  Image buildLogo({@required String assetPath}) => Image.asset(assetPath);

  BlocBuilder buildUsernameFormField() {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (BuildContext context, state) {
        return TextFormField(
          obscureText: false,
          onChanged: (value) => context
              .read<LoginBloc>()
              .add(LoginUsernameChanged(username: value)),
          validator: (value) => state.isValidUsername
              ? null
              : LocaleKeys.loginForm_validation_shortUsername.tr(),
          decoration: InputDecoration(
            labelText: LocaleKeys.loginForm_username.tr(),
            hintText: LocaleKeys.loginForm_username.tr(),
            alignLabelWithHint: true,
          ),
        );
      },
    );
  }

  BlocBuilder buildPasswordFormField() {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (BuildContext context, state) {
        return TextFormField(
          obscureText: true,
          onChanged: (value) => context
              .read<LoginBloc>()
              .add(LoginPasswordChanged(password: value)),
          validator: (value) => state.isValidPassword
              ? null
              : LocaleKeys.loginForm_validation_shortPassword.tr(),
          decoration: InputDecoration(
            labelText: LocaleKeys.loginForm_password.tr(),
            hintText: LocaleKeys.loginForm_password.tr(),
            alignLabelWithHint: true,
          ),
        );
      },
    );
  }

  BlocBuilder buildLoginButton() => BlocBuilder<LoginBloc, LoginState>(
        builder: (BuildContext context, state) {
          return ElevatedButton(
              onPressed: state.formStatus is FormSubmitting
                  ? null
                  : () {
                      if (_loginFormKey.currentState.validate()) {
                        context.read<LoginBloc>().add(LoginSubmitted());
                      }
                    },
              child: state.formStatus is FormSubmitting
                  ? SizedBox(
                      width: 15,
                      height: 15,
                      child: CircularProgressIndicator(),
                    )
                  : LocaleText(value: LocaleKeys.loginForm_login));
        },
      );
}
