import 'package:flutter/material.dart';
import 'package:mini_project/model/user_data_model.dart';
import 'package:mini_project/screen/tetangga_detail_screen/tetangga_detail_screen.dart';

Widget tetanggaWidget(UserDataModel userDataModel, BuildContext context) {
  return InkWell(
    onTap: () {
      Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (
            context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              TetanggaDetailScreen(
            userDataModel: userDataModel,
          ),
          transitionDuration: const Duration(milliseconds: 800),
          transitionsBuilder: (
            context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
        ),
      );
    },
    child: Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundImage: NetworkImage(userDataModel.avatar),
        ),
        const SizedBox(
          height: 8,
        ),
        Text('${userDataModel.firstName} ${userDataModel.lastName}'),
      ],
    ),
  );
}
