import 'package:flutter/cupertino.dart';
import '../models/menu_model.dart';
import '../services/menu_api.dart';

class MenuProvider extends ChangeNotifier {
  List<MenuModel> _menu = [];

  List<MenuModel> get menu => _menu;

  getAllMenu() async {
    final m = await MenuApi().getMenu();
    _menu = m!;
    notifyListeners();
  }
}
