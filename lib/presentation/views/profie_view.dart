import 'package:bloc_base_project/data/models/application_user_response.dart';
import 'package:bloc_base_project/presentation/blocs/profile/profile_bloc.dart';
import 'package:bloc_base_project/presentation/blocs/profile/profile_event.dart';
import 'package:bloc_base_project/presentation/blocs/profile/profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../blocs/form_submission_status.dart';

enum SnackBarStatus { ERROR, SUCCESS }

class ProfileView extends StatefulWidget {
  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final _updateApplicationUserFormKey = GlobalKey<FormState>();
  final _changePasswordFormKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    context.read<ProfileBloc>().add(ProfileRequested());
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
          if (state.passwordStatus is SubmissionSuccess) {
            _showSnackBar("Şifreniz değiştirildi", SnackBarStatus.SUCCESS);
          }
          if (state.informationStatus is SubmissionSuccess) {
            _showSnackBar("Bilgileriniz güncellendi", SnackBarStatus.SUCCESS);
          }
          if (state.passwordStatus is SubmissionFailed) {
            _showSnackBar(
                "Şifre değiştirilirken hata oluştu", SnackBarStatus.ERROR);
          }
          if (state.informationStatus is SubmissionFailed) {
            _showSnackBar(
                "Bilgiler güncellenirken hata oluştu", SnackBarStatus.ERROR);
          }
        },
        builder: (BuildContext context, state) {
          return state.formStatus is FormSubmitting
              ? buildProfileFormLoadingShimmer(size)
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      buildChangeInformationCard(context, state),
                      buildChangePasswordCard(context, state),
                    ],
                  ),
                );
        },
      ),
    );
  }

  Padding buildChangeInformationCard(BuildContext context, ProfileState state) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Form(
          key: _updateApplicationUserFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildUserInformationsCardTopic(context),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    buildNameTextFormField(),
                    buildSurnameTextFormField(),
                    buildEmailTextFormField(),
                    buildPhoneTextFormField(),
                  ],
                ),
              ),
              buildSaveUserInformationChangesButton(state, context),
            ],
          ),
        ),
      ),
    );
  }

  ListTile buildUserInformationsCardTopic(BuildContext context) {
    return ListTile(
      title: Text(
        "Bilgilerim",
        style: Theme.of(context).textTheme.headline5,
      ),
    );
  }

  Padding buildNameTextFormField() {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: "İsim",
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(),
          ),
        ),
      ),
    );
  }

  Padding buildSurnameTextFormField() {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: "Soyisim",
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(),
          ),
        ),
      ),
    );
  }

  Padding buildEmailTextFormField() {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: "Email",
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(),
          ),
        ),
      ),
    );
  }

  Padding buildPhoneTextFormField() {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: "Telefon",
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(),
          ),
        ),
      ),
    );
  }

  Padding buildSaveUserInformationChangesButton(
      ProfileState state, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
          onPressed: state.informationStatus is FormSubmitting
              ? null
              : () {
                  context.read<ProfileBloc>().add(ProfileSubmitted());
                },
          child: Text("Güncelle")),
    );
  }

  Padding buildChangePasswordCard(BuildContext context, ProfileState state) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Form(
          key: _changePasswordFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildChangePasswordCardTopic(context),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    buildCurrentPasswordTextFormField(context),
                    buildNewPasswordTextFormField(context),
                  ],
                ),
              ),
              buildSavePasswordChangesButton(state, context),
            ],
          ),
        ),
      ),
    );
  }

  ListTile buildChangePasswordCardTopic(BuildContext context) {
    return ListTile(
      title: Text(
        "Parola Yenileme",
        style: Theme.of(context).textTheme.headline5,
      ),
    );
  }

  Padding buildCurrentPasswordTextFormField(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: TextFormField(
        onChanged: (value) => context
            .read<ProfileBloc>()
            .add(ProfilePasswordChanged(password: value)),
        decoration: InputDecoration(
          labelText: "Güncel Parola *",
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(),
          ),
        ),
      ),
    );
  }

  Padding buildNewPasswordTextFormField(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: TextFormField(
        onChanged: (value) => context
            .read<ProfileBloc>()
            .add(ProfileNewPasswordChanged(newPassword: value)),
        decoration: InputDecoration(
          labelText: "Yeni Parola *",
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(),
          ),
        ),
      ),
    );
  }

  Padding buildSavePasswordChangesButton(
      ProfileState state, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: state.passwordStatus is FormSubmitting ||
                state.password == null ||
                state.newPassword == null ||
                state.password.isEmpty ||
                state.newPassword.isEmpty
            ? null
            : () {
                context.read<ProfileBloc>().add(PasswordSubmitted());
              },
        child: Text("Yenile"),
      ),
    );
  }

  SizedBox buildProfileFormLoadingShimmer(Size size) {
    return SizedBox(
      width: size.width,
      height: size.height,
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300],
        highlightColor: Colors.grey[100],
        child: Center(
          child: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(
                  10,
                  (index) => index % 5 == 0
                      ? buildShimmerFormTopic(size)
                      : buildShimmerFormField(size),
                )),
          ),
        ),
      ),
    );
  }

  Padding buildShimmerFormField(Size size) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        width: size.width * .9,
        height: size.height * .06,
        color: Colors.white,
      ),
    );
  }

  Padding buildShimmerFormTopic(Size size) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        width: size.width * .4,
        height: size.height * .07,
        color: Colors.white,
      ),
    );
  }

  _showSnackBar(String message, SnackBarStatus status) {
    Color snackBarColor =
        status == SnackBarStatus.ERROR ? Colors.red : Colors.green;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: snackBarColor,
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.all(8.0),
      duration: Duration(milliseconds: 1500),
    ));
  }
}
