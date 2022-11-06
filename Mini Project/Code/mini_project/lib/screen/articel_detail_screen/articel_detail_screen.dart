import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_project/model/articel_model.dart';
import 'package:mini_project/theme.dart';

class ArticelDetailScreen extends StatelessWidget {
  const ArticelDetailScreen({Key? key, required this.articel})
      : super(key: key);
  final Articel articel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          articel.title,
          style: GoogleFonts.inter(fontWeight: FontWeight.w500),
        ),
        backgroundColor: greenColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(kDefaultPadding),
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
              articel.description,
              style: GoogleFonts.inter(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              articel.content,
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}
