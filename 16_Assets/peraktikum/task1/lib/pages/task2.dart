import 'package:flutter/material.dart';

import '../modul/list.dart';

class Taks2 extends StatelessWidget {
  final ImageDataModel imageDataModel;
  const Taks2({Key? key, required this.imageDataModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Stack(
        children: [
          Container(
            decoration:BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(imageDataModel.imageUrl),
                  fit: BoxFit.cover),
            ),
          ),
        ],
      ),
    );
  }
}