import 'package:bloc_base_project/presentation/blocs/form_submission_status.dart';

class ProfileState {
  final FormSubmissionStatus formStatus;

  ProfileState({
    this.formStatus = const InitialFormStatus(),
  });

  ProfileState copyWith({FormSubmissionStatus formStatus}) {
    return ProfileState(formStatus: formStatus ?? this.formStatus);
  }
}
