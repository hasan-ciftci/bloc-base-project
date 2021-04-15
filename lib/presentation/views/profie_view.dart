import 'package:bloc_base_project/data/models/application_user_response.dart';
import 'package:bloc_base_project/presentation/blocs/profile/profile_bloc.dart';
import 'package:bloc_base_project/presentation/blocs/profile/profile_event.dart';
import 'package:bloc_base_project/presentation/blocs/profile/profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/form_submission_status.dart';

class ProfileView extends StatefulWidget {
  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  void initState() {
    super.initState();
    context.read<ProfileBloc>().add(ProfileRequested());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profil"),
      ),
      body: BlocConsumer<ProfileBloc, ProfileState>(
        listener: (context, state) {
          final formStatus = state.formStatus;
          if (formStatus is SubmissionSuccess) {
            ApplicationUserResponse applicationUserResponse = formStatus.object;
            print(applicationUserResponse.data.firstName);
          }
        },
        builder: (BuildContext context, state) {
          return state.formStatus is FormSubmitting
              ? Text("Yükleniyor")
              : Text("Yüklendi");
        },
      ),
    );
  }
}
