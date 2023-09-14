import 'dart:convert';
import 'package:onnovacion/Users/domain/user.dart';
import 'package:onnovacion/Users/domain/user.repository.dart';
import 'package:http/http.dart' as http;

class UserApiRepository implements UserRepository {
  @override
  Future<List<User>> get() async {
    var headers = {
      'Content-Type': 'application/json',
    };
    var uri = Uri.parse('http://192.168.0.8:3000/users');

    var request = http.Request('GET', uri);
    request.headers.addAll(headers);
    try {
      http.StreamedResponse response = await request.send();
      var streamedResponse = await response.stream.bytesToString();
      var dataDecode = jsonDecode(streamedResponse);
      print('dataDecode $dataDecode');
      List<User> users = (dataDecode as List<dynamic>)
          .map((user) => User.fromJson(user))
          .toList();
      return users;
    } catch (err) {
      return [];
    }
  }
}
