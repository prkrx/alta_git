import 'dart:developer';
import 'package:vector_math/vector_math_64.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
      ),
      home: const PreviewImage(),
    );
  }
}

class PreviewImage extends StatefulWidget {
  const PreviewImage({super.key});

  @override
  State<PreviewImage> createState() => _PreviewImageState();
}

class _PreviewImageState extends State<PreviewImage> with SingleTickerProviderStateMixin {
  late Animation _animation;
  late AnimationController  _animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = new AnimationController(vsync: this,duration: Duration(milliseconds: 500));
    _animation = Tween(begin: 1.0, end: 3.0).animate(CurvedAnimation(parent: _animationController, curve: Curves.easeInOut))..addListener(() {
      setState(() {
        
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: (() {
        if(_animationController.isCompleted){
          _animationController.reverse();
        } else {
          _animationController.forward();
        }
      }),
      child: Transform(
        alignment: FractionalOffset.center,
        transform: Matrix4.diagonal3(Vector3(_animation.value,_animation.value,_animation.value)), 
      child: Image.network("https://upload.wikimedia.org/wikipedia/commons/9/9a/Gull_portrait_ca_usa.jpg", width: 200,height: 200,)
      ),
    );
  }
}