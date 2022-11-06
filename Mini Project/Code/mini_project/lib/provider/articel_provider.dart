import 'package:flutter/material.dart';
import 'package:mini_project/model/articel_model.dart';
import 'package:mini_project/service/articel_service.dart';

class ArticelProvider extends ChangeNotifier {
  final ArticelService articelProvider = ArticelService();

  Future<List<Articel>> getAllArticel() async {
    final articel = await ArticelService.getArticel();
    notifyListeners();
    return articel;
  }
}
