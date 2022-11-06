import 'package:flutter/material.dart';
import 'package:mini_project/model/login_user_model.dart';
import 'package:mini_project/service/auth_service.dart';

class LoginUserProvider extends ChangeNotifier {
  final AuthService authService = AuthService();
  late LoginUser _user;

  LoginUser get user => _user;

  set user(LoginUser newUser) {
    _user = newUser;
    notifyListeners();
  }
}
