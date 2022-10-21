import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Contact extends StatefulWidget {
  const Contact({Key key}) : super(key: key);

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  final _firstname = TextEditingController();
  final _lastname = TextEditingController();
  final _email = TextEditingController();
  final _message = TextEditingController();

  String firstName = '';
  String lastName = '';
  String email = '';
  String msg = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('logo.png'), fit: BoxFit.cover)),
          ),
          title: Text(
            'Xfellz',
          ),
          centerTitle: true,
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.blue, Colors.grey.shade800],
                    begin: FractionalOffset.topLeft,
                    end: FractionalOffset.bottomRight)
                    ),
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              child: Column(
                children: [
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Container(
                              padding: EdgeInsets.only(top: 20),
                              child: Text(
                                'Selamat datang di XFELLZ',
                                style: TextStyle(fontSize: 20),
                              )),
                          Padding(
                            padding: const EdgeInsets.only(top: 30),
                            child: Container(
                              height: 260,
                              width: 350,
                              decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                          'logo.png'))),
                            ),
                          ),
                          
                          Padding(
                            padding: EdgeInsets.only(top: 90),
                            child: Container(
                              child: Text(
                                'Apakah ada pertanya pada aplikasi ini ??',
                                style: TextStyle(
                                    fontSize: 40, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: Container(
                              child: Text(
                                  'Jika ada pertanyaan bisa tulis di bawah ini'),
                            ),
                          ),
                          //Row Input Field
                          Padding(
                            padding: EdgeInsets.only(top: 30),
                            child: Container(
                                child: Row(
                              children: [
                                //First Name input field
                                Container(
                                  padding: EdgeInsets.only(left: 15),
                                  width: 160,
                                  child: TextField(
                                    controller: _firstname,
                                    decoration: InputDecoration(
                                        hintText: 'Nama depan',
                                        labelText: 'Nama depan',
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10))),
                                  ),
                                ),
                                //Last Name input field
                                Container(
                                  padding: EdgeInsets.only(left: 20),
                                  width: 170,
                                  child: TextField(
                                    controller: _lastname,
                                    decoration: InputDecoration(
                                        hintText: 'Nama Belakang',
                                        labelText: 'Nama Belakang',
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10))),
                                  ),
                                ),
                              ],
                            )),
                          ),
                          //End of Row input field

                          //Email input field
                          Container(
                            padding:
                                EdgeInsets.only(top: 20, left: 15, right: 14),
                            child: TextField(
                              controller: _email,
                              decoration: InputDecoration(
                                  hintText: 'Email',
                                  labelText: 'Email',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10))),
                            ),
                          ),

                          //Message input field
                          Container(
                            padding:
                                EdgeInsets.only(top: 20, left: 15, right: 14),
                            child: TextField(
                              controller: _message,
                              maxLines: 5,
                              decoration: InputDecoration(
                                  hintText: 'Pesan',
                                  labelText: 'Bisa tulis di sini',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10))),
                            ),
                          ),

                          //Send button 
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.blue
                              ),
                              // this actions contains error plis help :(
                              onPressed: (() {
                                Future.delayed(Duration.zero, () {
                                  setState(() {
                                          firstName = _firstname.text;
                                          lastName = _lastname.text;
                                          email = _email.text;
                                          msg = _message.text;
                                        });
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          content: Container(
                                            height: 300.0,
                                            width: 200.0,
                                            child: Column(
                                              children: [
                                                Text(
                                                    firstName),
                                                Text(
                                                    lastName),
                                                Text(
                                                    email),
                                                Text(
                                                    msg),
                                              ],
                                            ),
                                          ),
                                        );
                                      });
                                });
                              }),
                              child: Text('Kirim'))
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
