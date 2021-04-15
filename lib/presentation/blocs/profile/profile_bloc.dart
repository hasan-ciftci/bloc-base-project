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
  }
}
