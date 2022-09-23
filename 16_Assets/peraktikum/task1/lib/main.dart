import 'package:flutter/material.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}
class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GridView.count(
        crossAxisCount: 4,
      children: <Widget>[
        ClipOval(
          child: Image.network(
            'https://jete.id/wp-content/uploads/2021/10/Wallpaper-Windows-XP.jpg',
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
        ),
        ClipOval(
          child: Image.network(
            'https://images.pexels.com/photos/50594/sea-bay-waterfront-beach-50594.jpeg?auto=compress&cs=tinysrgb&w=600',
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
        ),
        ClipOval(
          child: Image.network(
            'https://images.pexels.com/photos/36717/amazing-animal-beautiful-beautifull.jpg?auto=compress&cs=tinysrgb&w=600',
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}