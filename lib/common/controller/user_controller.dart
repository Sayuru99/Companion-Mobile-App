import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/user.dart';

class UserController {
  Future<List<User>> fetchUser(int userId) async {
    final response = await http.get(Uri.parse(
        'https://my-json-server.typicode.com/Sayuru99/json_server/users'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((user) => User.fromJson(user)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }
}
