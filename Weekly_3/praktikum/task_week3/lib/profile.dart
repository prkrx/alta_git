import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import 'package:task_week1/service.dart';
import 'providers/login_provider.dart';
import 'models/login_model.dart';


class ProfilePage extends StatefulWidget {
  const ProfilePage({Key key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}
  class _ProfilePageState extends State<ProfilePage> {
  SharedPreferences loginData;
  String name = '';
  String email = '';
  String date = '';
  String desc = '';
  
  get provider => null;

  @override
  void initState() {
    super.initState();
    initial();
  }

  void initial() async {
    loginData = await SharedPreferences.getInstance();
    setState(() {
      name = loginData.getString('nama').toString();
      email = loginData.getString('email').toString();
      date = loginData.getString('tgl').toString();
      desc = loginData.getString('desc').toString();
    });
  }

  
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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(11.0),
          child: Column(
            children: [
              const SizedBox(
                height: 24,
              ),
              Text('Nama :'),
              Text(
                name,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              const SizedBox(
                height: 8,
              ),
              Text('Email :'),
              Text(
                email,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              const SizedBox(
                height: 8,
              ),
              Text('Tgl lahir :'),
              Text(
                date,
                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20),
              ),
              const SizedBox(
                height: 8,
              ),
              Text('Tentang :'),
              Text(
                desc,
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 13,
              ),
              ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(primary: Colors.purple.shade600),
                  onPressed: () {
                    loginData.setBool('masuk', true);
                    loginData.remove('nama');
                    loginData.remove('email');
                    loginData.remove('Tgl');
                    loginData.remove('desc');
                    provider.removeData(LoginModel(name: name, email: email));
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => Contact()));
                  },
                  child: Text('Keluar'))
            ],
          ),
        ),
      ),
    );
  }
}
