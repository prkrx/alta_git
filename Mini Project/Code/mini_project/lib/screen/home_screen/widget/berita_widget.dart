import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_project/model/articel_model.dart';
import 'package:mini_project/screen/articel_detail_screen/articel_detail_screen.dart';
import 'package:mini_project/theme.dart';

Widget beritaWidget(Articel articel, BuildContext context) {
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
              ArticelDetailScreen(
            articel: articel,
          ),
          transitionDuration: const Duration(seconds: 1),
          transitionsBuilder: (
            context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              ScaleTransition(
            scale: animation,
            alignment: Alignment.center,
            child: child,
          ),
        ),
      );
    },
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 150,
        width: 250,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          image: DecorationImage(
            image: NetworkImage(articel.urlToIlamge),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            top: 70,
            left: 10,
            right: 10,
          ),
          child: Text(
            articel.title,
            style: GoogleFonts.inter(
              color: whiteColor,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.justify,
          ),
        ),
      ),
    ),
  );
}
