import 'package:get/get.dart';
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
    print('users: $users');
    User? userFound = users.firstWhereOrNull(
        (user) => user.email == username && user.password == password);
    print(userFound);
    // ignore: unnecessary_null_comparison
    if (userFound == null) {
      return false;
    }
    return true;
  }
}
