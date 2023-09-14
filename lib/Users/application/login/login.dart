import 'package:onnovacion/Users/domain/user.dart';
import 'package:onnovacion/Users/domain/user.repository.dart';

class LoginService {
  final UserRepository repository;
  LoginService({required this.repository});

  Future<bool> execute(
    String username,
    String password,
  ) async {
    List<User> users = await repository.get();
    print('username: $username');
    print('password: $password');
    User? userFound = users.firstWhere(
      (user) => user.email == username && user.password == password,
    );
    // ignore: unnecessary_null_comparison
    if (userFound == null) {
      return false;
    }
    return true;
  }
}
