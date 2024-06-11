class AuthService {
  // Dummy function to simulate login
  Future<bool> login(String username, String password) async {
    // Simulate network delay
    await Future.delayed(Duration(seconds: 2));
    // Simulate credential check
    return username == 'user' && password == 'password';
  }
}
