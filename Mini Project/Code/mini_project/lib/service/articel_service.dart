import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mini_project/model/articel_model.dart';

class ArticelService {

  static Future<List<Articel>> getArticel() async {
    final res = await http.get(Uri.parse("https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=36c7d0bdd70a468d82d558ae4062d69b"));

    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);

      List<dynamic> body = json['articles'];

      List<Articel> articel =
          body.map((dynamic item) => Articel.fromJson(item)).toList();

      return articel;
    } else {
      throw ('Datanya Kosong');
    }
  }
}
