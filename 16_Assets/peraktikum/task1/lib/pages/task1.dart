import 'package:flutter/material.dart';
import 'package:task1/modul/list.dart';
import 'package:task1/pages/task2.dart';


class Taks1 extends StatelessWidget {
  const Taks1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => Taks2(
                    imageDataModel: imageData[index],
                    ),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                      image: NetworkImage(imageData[index].imageUrl),
                      fit: BoxFit.cover),
                ),
              ),
            ),
          );
        },
        itemCount: imageData.length,
      ),
    );
  }
}