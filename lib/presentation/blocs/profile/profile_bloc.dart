import 'package:bloc/bloc.dart';
import 'package:bloc_base_project/data/models/application_user_response.dart';
import 'package:bloc_base_project/data/repositories/profile_repository.dart';
import 'package:bloc_base_project/presentation/blocs/form_submission_status.dart';
import 'package:bloc_base_project/presentation/blocs/profile/profile_event.dart';
import 'package:bloc_base_project/presentation/blocs/profile/profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileRepository profileRepository;

  ProfileBloc({this.profileRepository}) : super(ProfileState());

  @override
  Stream<ProfileState> mapEventToState(ProfileEvent event) async* {
    if (event is ProfileRequested) {
      yield state.copyWith(formStatus: FormSubmitting());
      try {
        ApplicationUserResponse applicationUserResponse =
            await profileRepository.getApplicationUser();

        yield state.copyWith(
            formStatus: SubmissionSuccess(object: applicationUserResponse));
      } catch (e) {
        yield state.copyWith(formStatus: SubmissionFailed(e));
      }
    }
    if (event is ProfileSubmitted) {
      yield state.copyWith(informationStatus: FormSubmitting());
      try {
        //TODO: CREATE MODEL WITH NEW PROFILE INFO
        //CREATE MODEL WITH NEW PROFILE INFO
        //SEND IT TO SUBMISSION SUCCESS AS A PARAMETER

        await profileRepository.updateApplicationUser();

        yield state.copyWith(informationStatus: SubmissionSuccess());
      } catch (e) {
        yield state.copyWith(informationStatus: SubmissionFailed(e));
      } finally {
        yield state.copyWith(informationStatus: InitialFormStatus());
      }
    }
    if (event is PasswordSubmitted) {
      yield state.copyWith(passwordStatus: FormSubmitting());
      try {
        //TODO: CREATE MODEL WITH NEW PASSWORD INFO
        //CREATE MODEL WITH NEW PASSWORD INFO
        //SEND IT TO SUBMISSION SUCCESS AS A PARAMETER
        await profileRepository.changePassword();
        yield state.copyWith(passwordStatus: SubmissionSuccess());
      } catch (e) {
        yield state.copyWith(passwordStatus: SubmissionFailed(e));
      } finally {
        yield state.copyWith(passwordStatus: InitialFormStatus());
      }
    }
    if (event is ProfileUsernameChanged) {
      yield state.copyWith(username: event.username);
    }
    if (event is ProfileSurnameChanged) {
      yield state.copyWith(surname: event.surname);
    }
    if (event is ProfileEmailChanged) {
      yield state.copyWith(email: event.email);
    }
    if (event is ProfilePhoneChanged) {
      yield state.copyWith(phone: event.phone);
    }
    if (event is ProfilePasswordChanged) {
      yield state.copyWith(password: event.password);
    }
    if (event is ProfileNewPasswordChanged) {
      yield state.copyWith(newPassword: event.newPassword);
    }
  }
}
