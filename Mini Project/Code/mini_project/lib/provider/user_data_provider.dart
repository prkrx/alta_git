import 'package:flutter/material.dart';
import 'package:mini_project/model/user_data_model.dart';
import 'package:mini_project/service/user_data_service.dart';

class UserDataProvider extends ChangeNotifier {
  final UserDataService userDataService = UserDataService();

  Future<List<UserDataModel>> getDataAllUser() async {
    final user = await UserDataService.getDataUser();
    notifyListeners();
    return user;
  }
}
