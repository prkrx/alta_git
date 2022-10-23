import 'package:flutter/material.dart';


class ProfilePage extends StatelessWidget {
  final String name;
  final String email;
  final String date;
  final String desc;

  const ProfilePage({ Key key, @required this.name, this.email, this.date, this.desc,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Data diri',
          style: TextStyle(),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
              color: Color.fromARGB(100, 6, 100, 255)
              ),
        ),
      ),
      
    );
  }
}
