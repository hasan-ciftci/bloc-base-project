import 'package:bloc_base_project/data/models/application_user_response.dart';

class ProfileRepository {
  Future<ApplicationUserResponse> getApplicationUser() async {
    await Future.delayed(Duration(seconds: 2));
    /*
    String username =
        PreferencesManager.instance.getStringValue(PreferencesKeys.USER_NAME);

    var response = await NetworkManager.instance.dioGet<UserModel>(
      baseURL: ApiConstants.AUTH_BASE_URL,
      endPoint: ApiConstants.GET_APPLICATION_USER_ENDPOINT + username,
    );

    //return Application user model created with response
     */

    return ApplicationUserResponse(
        data: Data(firstName: "Hasan", lastName: "Çiftçi"));
  }

  updateApplicationUser() async {
    await Future.delayed(Duration(seconds: 2));
  }

  changePassword() async {
    await Future.delayed(Duration(seconds: 2));
  }
}
