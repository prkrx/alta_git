import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      home: new ListBuilder(),
    );
  }
}

class ListBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
          // ignore: prefer_const_literals_to_create_immutables
          children: <Widget>[
            const Card(
              child: ListTile(
                leading: FlutterLogo(size: 56.0),
                title: Text('Made'),
                subtitle: Text('0866571373'),
                trailing: Icon(Icons.more_vert),
              ),
            ),
            const Card(
              child: ListTile(
                leading: FlutterLogo(size: 56.0),
                title: Text('Dodi'),
                subtitle: Text('08452214516'),
                trailing: Icon(Icons.more_vert),
              ),
            ),
            const Card(
              child: ListTile(
                leading: FlutterLogo(size: 56.0),
                title: Text('Andi'),
                subtitle: Text('0865713613'),
                trailing: Icon(Icons.more_vert),
              ),
            ),
            const Card(
              child: ListTile(
                leading: FlutterLogo(size: 56.0),
                title: Text('Reza'),
                subtitle: Text('085563713'),
                trailing: Icon(Icons.more_vert),
              ),
            ),
            ElevatedButton(
            onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SecondRoute()),
            );
          },
              child: const Text('Create New Contact'),
          ),
        ],
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  const SecondRoute({super.key});

  @override
Widget build(BuildContext context) {
  return Material(
    child:  ListView(
      children: <Widget>[
        TextField(
          decoration: InputDecoration(labelText: 'Nama'),
        ),
        TextField(
          decoration: InputDecoration(labelText: 'No Telpon'),
        ),
        ElevatedButton(
          onPressed: () {
          },
          child: new Text('Submit'),
        ),
      ],
    ),
  );
  }
}