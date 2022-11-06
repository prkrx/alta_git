import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../theme.dart';

class PembayaranWidget extends StatelessWidget {
  const PembayaranWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 50,
      decoration: BoxDecoration(
        color: whiteColor.withOpacity(0.1),
        border: Border.all(
          color: const Color(0xffD9DEEA),
        ),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.only(
              left: 15,
            ),
          ),
          Image.asset(
            'assets/image/gopay.png',
            width: 60,
            height: 60,
          ),
          const SizedBox(
            width: 30,
          ),
          Text(
            'Gopay',
            style: GoogleFonts.inter(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
