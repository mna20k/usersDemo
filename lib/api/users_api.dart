import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/users_model.dart';

class UsersApi {
  Future<List<Users>> getAllUsers() async {
    try {
      const String url = "https://jsonplaceholder.typicode.com/users";

      var response = await http.get(Uri.parse(url));

      List<Users> users = (json.decode(response.body))
          .map<Users>((jsonUser) => Users.fromJson(jsonUser))
          .toList();

      return users;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Users>> deleteUsers(String usersId) async {
    try {
      final String url = "https://jsonplaceholder.typicode.com/users/$usersId";

      var response = await http.delete(Uri.parse(url));

      List<Users> users = (json.decode(response.body))
          .map<Users>((jsonUser) => Users.fromJson(jsonUser))
          .toList();

      return users;
    } catch (e) {
      rethrow;
    }
  }
}
