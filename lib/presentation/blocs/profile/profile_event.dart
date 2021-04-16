import 'package:equatable/equatable.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();
}

class ProfileRequested extends ProfileEvent {
  @override
  List<Object> get props => [];
}

class ProfileUsernameChanged extends ProfileEvent {
  final String username;

  ProfileUsernameChanged({this.username});

  @override
  List<Object> get props => [username];
}

class ProfileSurnameChanged extends ProfileEvent {
  final String surname;

  ProfileSurnameChanged({this.surname});

  @override
  List<Object> get props => [surname];
}

class ProfileEmailChanged extends ProfileEvent {
  final String email;

  ProfileEmailChanged({this.email});

  @override
  List<Object> get props => [email];
}

class ProfilePhoneChanged extends ProfileEvent {
  final String phone;

  ProfilePhoneChanged({this.phone});

  @override
  List<Object> get props => [phone];
}

class ProfilePasswordChanged extends ProfileEvent {
  final String password;

  ProfilePasswordChanged({this.password});

  @override
  List<Object> get props => [password];
}

class ProfileNewPasswordChanged extends ProfileEvent {
  final String newPassword;

  ProfileNewPasswordChanged({this.newPassword});

  @override
  List<Object> get props => [newPassword];
}

class ProfileSubmitted extends ProfileEvent {
  @override
  List<Object> get props => [];
}

class PasswordSubmitted extends ProfileEvent {
  @override
  List<Object> get props => [];
}
