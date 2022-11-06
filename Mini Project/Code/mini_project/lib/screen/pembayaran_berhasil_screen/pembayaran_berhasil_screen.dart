import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_project/screen/home_screen/home_screen.dart';
import 'package:mini_project/theme.dart';

class PembayaranBerhasilScreen extends StatelessWidget {
  const PembayaranBerhasilScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 135),
            ),
            Image.asset(
              'assets/image/payment_success-illustration.png',
              height: 210,
              width: 235,
            ),
            const SizedBox(
              height: 35,
            ),
            Text(
              'Payment Success',
              style: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              'hooorayyy!!! your payment was successful!',
              style: GoogleFonts.inter(),
            ),
            const SizedBox(
              height: 55,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomeScreen(),
                  ),
                );
              },
              child: Text(
                'Back to Home',
                style: GoogleFonts.inter(
                    fontSize: 16, fontWeight: FontWeight.w500),
              ),
              style: ElevatedButton.styleFrom(
                primary: greenColor,
                fixedSize: const Size(300, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
