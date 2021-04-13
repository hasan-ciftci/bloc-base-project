import 'package:bloc_base_project/core/base/base_model.dart';

class UserModel implements BaseModel {
  String username;
  String password;

  UserModel(this.username, this.password);

  UserModel.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['password'] = this.password;
    return data;
  }

  @override
  fromJson(Map<String, dynamic> json) {
    return UserModel.fromJson(json);
  }
}
