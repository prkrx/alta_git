// ignore_for_file: prefer_const_constructors
import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '/models/login_model.dart';
import '/profile.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_week1/providers/login_provider.dart' as login_provider;
import '../service.dart';

class ProfileAdd extends StatefulWidget {
  const ProfileAdd({Key key}) : super(key: key);

  @override
  State<ProfileAdd> createState() => _ProfileAddState();
}

class _ProfileAddState extends State<ProfileAdd> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController captionsController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  String name;
  String email;
  String date;
  String desc;
  File image;

  SharedPreferences loginData;
  bool newUser;

  //image picker function
  Future pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;

    final tempImage = File(image.path);
    setState(() => this.image = tempImage);
  }

  @override
  void initState() {
    super.initState();
    checkLogin();
  }

  void checkLogin() async {
    loginData = await SharedPreferences.getInstance();
    newUser = loginData.getBool('masuk') ?? true;

    if (newUser == false) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => ProfilePage()),
          (route) => false);
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    captionsController.dispose();
    dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<login_provider.LoginProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Xfellz',
          style: TextStyle(),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
              
              ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: 20, left: 15, right: 15, bottom: 30),
                    child: Text(
                      'Data diri',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  //Image
                  image != null
                      ? ClipOval(
                        child: Image.file(
                            image,
                            width: 160,
                            height: 160,
                            fit: BoxFit.cover,
                          ),
                      )
                      : Container(),
                  //Image Picker
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.blue),
                        onPressed: () {
                          return pickImage();
                        },
                        child: Text('Pilih foto data diri anda')),
                  ),

                  //Name Field
                  Padding(
                    padding: EdgeInsets.only(top: 20, left: 15, right: 15),
                    child: TextFormField(
                      controller: nameController,
                      validator: (String value) {
                        return value == '' ? 'Wajib di isi' : null;
                      },
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.abc_rounded),
                          hintText: 'Nama',
                          label: Text('Nama'),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                  ),

                  //Date Picker
                  Padding(
                    padding: EdgeInsets.only(top: 20, left: 15, right: 15),
                    child: TextFormField(
                      controller: dateController,
                      validator: (String value) {
                        return value == ''
                            ? 'Wajib di isi'
                            : null;
                      },
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.calendar_month_outlined),
                          hintText: 'Tgl lahir',
                          label: Text('Tgl lahir'),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                      onTap: () async {
                        DateTime selectedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2025));
                        if (selectedDate != null) {
                          setState(() {
                            dateController.text =
                                DateFormat('yyyy-MM-dd').format(selectedDate);
                          });
                        }
                      },
                    ),
                  ),

                  // Email Field
                  Padding(
                    padding: EdgeInsets.only(top: 20, left: 15, right: 15),
                    child: TextFormField(
                      controller: emailController,
                      validator: (String value) {
                        return value == '' ? 'Wajib di isi' : null;
                      },
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.mail_outline_outlined),
                          hintText: 'Email',
                          label: Text('Email'),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                  ),

                  //Captions field
                  Padding(
                    padding: EdgeInsets.only(top: 20, left: 15, right: 15),
                    child: TextFormField(
                      maxLines: 3,
                      controller: captionsController,
                      validator: (String value) {
                        return value == '' ? 'Wajib di isi' : null;
                      },
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.description_outlined),
                          hintText: 'Ceritakan data diri',
                          label: Text('Captions'),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                  ),

                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.blue),
                      onPressed: (() {
                        final isValidForm = _formKey.currentState.validate();
                        String name = nameController.text;
                        String email = emailController.text;
                        String date = dateController.text;
                        String desc = captionsController.text;
                        if (isValidForm) {
                          loginData.setBool('login', false);
                          loginData.setString('nama', name);
                          loginData.setString('email', email);
                          loginData.setString('Tgl', date);
                          loginData.setString('desc', desc);
                          provider.addLoginData(LoginModel(
                              name: name,
                              email: email,
                              date: date,
                              desc: desc));
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProfilePage()),
                              (route) => false);
                        }
                      }),
                      child: Text('Simpan'))
                ],
              )),
        ),
      ),
    );
  }
}
