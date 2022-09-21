import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Belajar Alta"),
        ),
        body: const HomeScreen()
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
        crossAxisCount: 4,
        children: const <Widget>[
          Icon(
            Icons.audiotrack,
            color: Colors.green,
            size: 24.0,
          ),
          Icon(
            Icons.beach_access,
            color: Colors.blue,
            size: 24.0,
          ),
          Icon(
            Icons.search,
            size: 24.0,
          ),
          Icon(
            Icons.account_circle,
            color: Colors.tealAccent,
            size: 24.0,
          ),
          Icon(
            Icons.audiotrack,
            color: Colors.green,
            size: 24.0,
          ),
          Icon(
            Icons.beach_access,
            color: Colors.blue,
            size: 24.0,
          ),
          Icon(
            Icons.search,
            size: 24.0,
          ),
          Icon(
            Icons.account_circle,
            color: Colors.tealAccent,
            size: 24.0,
          ),
          Icon(
            Icons.audiotrack,
            color: Colors.green,
            size: 24.0,
          ),
          Icon(
            Icons.beach_access,
            color: Colors.blue,
            size: 24.0,
          ),
          Icon(
            Icons.search,
            size: 24.0,
          ),
          Icon(
            Icons.account_circle,
            color: Colors.tealAccent,
            size: 24.0,
          ),
          Icon(
            Icons.audiotrack,
            color: Colors.green,
            size: 24.0,
          ),
          Icon(
            Icons.beach_access,
            color: Colors.blue,
            size: 24.0,
          ),
          Icon(
            Icons.search,
            size: 24.0,
          ),
          Icon(
            Icons.account_circle,
            color: Colors.tealAccent,
            size: 24.0,
          ),
          Icon(
            Icons.audiotrack,
            color: Colors.green,
            size: 24.0,
          ),
          Icon(
            Icons.beach_access,
            color: Colors.blue,
            size: 24.0,
          ),
          Icon(
            Icons.search,
            size: 24.0,
          ),
          Icon(
            Icons.account_circle,
            color: Colors.tealAccent,
            size: 24.0,
          )
        ],
    );
  }
}

