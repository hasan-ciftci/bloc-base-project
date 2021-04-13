class AuthenticationRepository {
  Future<void> login() async {
    print("login started");
    await Future.delayed(Duration(seconds: 3));
    print("login complete");
  }
}
