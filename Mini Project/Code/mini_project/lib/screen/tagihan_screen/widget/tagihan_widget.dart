import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TagihanWidget extends StatelessWidget {
  const TagihanWidget({Key? key, required this.keterangan, required this.total})
      : super(key: key);
  final String keterangan;
  final String total;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20, left: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            keterangan,
            style: GoogleFonts.inter(),
            textAlign: TextAlign.left,
          ),
          Text(
            total,
            style: GoogleFonts.inter(),
          )
        ],
      ),
    );
  }
}
