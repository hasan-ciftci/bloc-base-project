import 'package:bloc_base_project/presentation/blocs/form_submission_status.dart';

class LoginState {
  final String username;

  bool get isValidUsername => username != null && username.length > 3;
  final String password;

  bool get isValidPassword => password != null && password.length > 3;
  final FormSubmissionStatus formStatus;

  LoginState({
    this.username,
    this.password,
    this.formStatus = const InitialFormStatus(),
  });

  LoginState copyWith(
      {String username, String password, FormSubmissionStatus formStatus}) {
    return LoginState(
        username: username ?? this.username,
        password: password ?? this.password,
        formStatus: formStatus ?? this.formStatus);
  }
}
