import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_project/model/articel_model.dart';
import 'package:mini_project/screen/articel_detail_screen/articel_detail_screen.dart';
import 'package:mini_project/theme.dart';

Widget listTileWidget(Articel articel, BuildContext context) {
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
    child: Container(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 3),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: NetworkImage(articel.urlToIlamge),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: greenColor,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Text(
              articel.source.name,
              style: GoogleFonts.inter(
                color: whiteColor,
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            articel.title,
            style: GoogleFonts.inter(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            articel.publishedAt,
            style: GoogleFonts.inter(),
          ),
        ],
      ),
    ),
  );
}
