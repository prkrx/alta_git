import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_project/theme.dart';

class Riwayat extends StatelessWidget {
  const Riwayat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: greenColor,
        centerTitle: true,
        title: Text(
          'Riwayat',
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(kDefaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Pembayaran Berhasil',
              style: GoogleFonts.inter(
                color: greenColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Pembayaran Uang Jalan Bulan \nApril 2022',
                  style: GoogleFonts.inter(),
                ),
                Text(
                  'Rp. 25.000',
                  style: GoogleFonts.inter(
                    color: greenColor,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                const Icon(
                  Icons.timelapse_outlined,
                  size: 16,
                  color: Color(0xff68687A),
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  '03-04-2022',
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    color: const Color(0xff68687A),
                  ),
                ),
              ],
            ),
            const Divider(
              thickness: 1,
            ),
            Text(
              'Pembayaran Berhasil',
              style: GoogleFonts.inter(
                color: greenColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Pembayaran Uang Kas Bulan \nMaret 2022',
                  style: GoogleFonts.inter(),
                ),
                Text(
                  'Rp. 50.000',
                  style: GoogleFonts.inter(
                    color: greenColor,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                const Icon(
                  Icons.timelapse_outlined,
                  size: 16,
                  color: Color(0xff68687A),
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  '01-03-2022',
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    color: const Color(0xff68687A),
                  ),
                ),
              ],
            ),
            const Divider(
              thickness: 1,
            ),
            Text(
              'Pembayaran Berhasil',
              style: GoogleFonts.inter(
                color: greenColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Pembayaran Uang Sampah Bulan \nJanuari 2022',
                  style: GoogleFonts.inter(),
                ),
                Text(
                  'Rp. 75.000',
                  style: GoogleFonts.inter(
                    color: greenColor,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                const Icon(
                  Icons.timelapse_outlined,
                  size: 16,
                  color: Color(0xff68687A),
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  '17-01-2022',
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    color: const Color(0xff68687A),
                  ),
                ),
              ],
            ),
            const Divider(
              thickness: 1,
            ),
          ],
        ),
      ),
    );
  }
}
