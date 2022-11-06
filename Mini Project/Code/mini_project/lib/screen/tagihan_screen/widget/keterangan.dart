import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Keterangan extends StatelessWidget {
  const Keterangan({Key? key, required this.keterangan, required this.jenis})
      : super(key: key);
  final String keterangan;
  final String jenis;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            keterangan,
            style: GoogleFonts.inter(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            jenis,
            style: GoogleFonts.inter(),
          ),
        ],
      ),
    );
  }
}
