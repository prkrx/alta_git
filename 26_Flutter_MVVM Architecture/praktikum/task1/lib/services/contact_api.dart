import 'dart:convert';
import 'package:task1/models/contact_model.dart';
import 'package:http/http.dart' as http;

class ContactApi {
  Future<List<ContactModel>> getContact() async {
    //Membuat variabel baru untuk menampilkan hasil dari request http
    var result = await http.get(
      Uri.parse(
          'https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts'),
    );

    //Membuat pengkondisian
    if (result.statusCode == 200) {
      List data =
          jsonDecode(result.body); //Melakukan convert kedalam bentuk object
      List<ContactModel> contact =
          data.map((item) => ContactModel.fromJson(item)).toList();
      return contact;
    } else {
      return <
          ContactModel>[]; //mengembalikan list kosong jika statusCode bukan 200
    }
  }

  Future<bool> tambahContact(
      {required String name, required String number}) async {
    //Membuat variabel baru untuk menampilkan hasil dari request http
    var result = await http.post(
      Uri.parse(
          'https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts'),
      body: {'name': name, 'number': number},
    );

    //Membuat pengkondisian
    if (result.statusCode == 201) {
      return true;
    } else {
      return false; //mengembalikan list kosong jika statusCode bukan 200
    }
  }
}
