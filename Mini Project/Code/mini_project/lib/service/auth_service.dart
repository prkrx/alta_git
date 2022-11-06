import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mini_project/model/login_user_model.dart';

class AuthService {
  Future<LoginUser?> register(
    final String email,
    final String password,
    final String name,
    final String goal,
  ) async {
    try {
      final body = {
        'email': email,
        'password': password,
        'name': name,
        'goal': goal,
      };

      final response = await http.post(
        Uri.parse('https://bwa-jobs.herokuapp.com/register'),
        body: body,
      );

      if (response.statusCode == 200) {
        return LoginUser.fromJson(
          jsonDecode(response.body),
        );
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<LoginUser?> login(
    final String email,
    final String password,
  ) async {
    try {
      final body = {
        'email': email,
        'password': password,
      };

      final response = await http.post(
        Uri.parse('https://bwa-jobs.herokuapp.com/login'),
        body: body,
      );
      if (response.statusCode == 200) {
        return LoginUser.fromJson(
          jsonDecode(response.body),
        );
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
