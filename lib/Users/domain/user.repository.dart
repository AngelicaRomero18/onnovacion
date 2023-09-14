import 'package:onnovacion/Users/domain/user.dart';

abstract class UserRepository {
  Future<List<User>> get();
}
