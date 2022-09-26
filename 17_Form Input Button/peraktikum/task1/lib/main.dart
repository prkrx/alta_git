import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
  final Nama = TextEditingController(text: "Richo Dwi Wardiyanto Romadhon");
  final Telpon = TextEditingController(text: "085822553194");
  
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    const appTitle = 'Contacts';
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
        ),
        body: const Contacts(),
      ),
    );
  }
}

class Contacts extends StatefulWidget {
  const Contacts({super.key});
  
  @override
  State<Contacts> createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {


  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        TextField(
          decoration: InputDecoration(labelText: 'Nama'),
          controller: Nama,
        ),
        TextField(
          decoration: InputDecoration(labelText: 'No Telpon'),
          controller: Telpon,
        ),
        ElevatedButton(
          onPressed: () {
           _sendDataToSecondScreen(context);
          },
          child: new Text('Submit'),
        ),
      ],
    );
  }
  void _sendDataToSecondScreen(BuildContext context) {
    String textToSend = Nama.text;
    String textToSend2 = Telpon.text;
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SecondScreen(text: textToSend, text2: textToSend2),
        ));
  }
}


class SecondScreen extends StatelessWidget {
  final String text;
  final String text2;
  // receive data from the FirstScreen as a parameter
  SecondScreen({Key, required this.text, required this.text2}) : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("New Contacts")),
      body: ListView(
        children: <Widget>[
          Text(text),
          Text(text2)
        ],
      ),
    );
  }
}