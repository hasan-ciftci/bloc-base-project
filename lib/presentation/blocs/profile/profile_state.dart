import 'package:bloc_base_project/presentation/blocs/form_submission_status.dart';
import 'package:equatable/equatable.dart';

class ProfileState extends Equatable {
  @override
  List<Object> get props => [
        username,
        surname,
        email,
        phone,
        password,
        newPassword,
        formStatus,
        passwordStatus,
        informationStatus
      ];

  bool get isValidUsername => username != null && username.length > 3;
  final String username;
  bool get isValidSurname => surname != null && surname.length > 3;
  final String surname;
  final String email;
  final String phone;
  final String password;
  final String newPassword;

  final FormSubmissionStatus informationStatus;
  final FormSubmissionStatus passwordStatus;
  final FormSubmissionStatus formStatus;

  ProfileState({
    this.informationStatus = const InitialFormStatus(),
    this.passwordStatus = const InitialFormStatus(),
    this.formStatus = const InitialFormStatus(),
    this.username,
    this.surname,
    this.email,
    this.phone,
    this.password,
    this.newPassword,
  });

  ProfileState copyWith({
    FormSubmissionStatus formStatus,
    FormSubmissionStatus passwordStatus,
    FormSubmissionStatus informationStatus,
    String username,
    String surname,
    String email,
    String phone,
    String password,
    String newPassword,
  }) {
    return ProfileState(
      informationStatus: informationStatus ?? this.informationStatus,
      passwordStatus: passwordStatus ?? this.passwordStatus,
      formStatus: formStatus ?? this.formStatus,
      username: username ?? this.username,
      surname: surname ?? this.surname,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      password: password ?? this.password,
      newPassword: newPassword ?? this.newPassword,
    );
  }
}
