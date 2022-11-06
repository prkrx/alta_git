import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mini_project/service/user_data_service.dart';

void main() {
  test("ambil data user", () async {
    var user = await UserDataService.getDataUser();
    expect(user.isNotEmpty, true);
  });
  
}
