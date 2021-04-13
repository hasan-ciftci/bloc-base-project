import 'package:bloc_base_project/core/constants/api_constants.dart';
import 'package:bloc_base_project/core/init/network/network_manager.dart';
import 'package:bloc_base_project/data/models/user_model.dart';

class AuthenticationRepository {
  Future<void> login({String username, String password}) async {
    UserModel userModel = UserModel(username, password);

    var response = await NetworkManager.instance.dioPost<UserModel>(
        baseURL: ApiConstants.LOGIN_BASE_URL,
        endPoint: ApiConstants.LOGIN_ENDPOINT,
        model: userModel);
    print(response);
    print("login complete");
  }
}
