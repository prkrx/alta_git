import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_project/screen/pembayaran_berhasil_screen/pembayaran_berhasil_screen.dart';
import 'package:mini_project/theme.dart';

class PembayaranScreen extends StatefulWidget {
  const PembayaranScreen({Key? key}) : super(key: key);

  @override
  State<PembayaranScreen> createState() => _PembayaranScreenState();
}

class _PembayaranScreenState extends State<PembayaranScreen> {
  int selected = -1;
  @override
  Widget build(BuildContext context) {
    Widget option(
      int index,
      String imageUrl,
      String text,
    ) {
      return GestureDetector(
        onTap: () {
          setState(() {
            selected = index;
          });
        },
        child: Container(
          width: 400,
          height: 50,
          decoration: BoxDecoration(
            color: whiteColor.withOpacity(0.1),
            border: Border.all(
              color: selected == index ? greenColor : const Color(0xffD9DEEA),
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
                imageUrl,
                width: 60,
                height: 60,
              ),
              const SizedBox(
                width: 30,
              ),
              Text(
                text,
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 100,
                ),
                child: selected == index
                    ? const Icon(
                        Icons.check,
                        color: greenColor,
                      )
                    : null,
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pembayaran',
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        backgroundColor: greenColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(kDefaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'E-Wallet',
                style: GoogleFonts.inter(
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              option(0, 'assets/image/gopay.png', 'Gopay'),
              const SizedBox(
                height: 20,
              ),
              option(1, 'assets/image/gopay.png', 'Ovo'),
              const SizedBox(
                height: 20,
              ),
              option(2, 'assets/image/gopay.png', 'Shoppay')
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Text(
              'Rp. 150.000',
              style: GoogleFonts.inter(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Container(
              width: 153,
              height: 47,
              decoration: BoxDecoration(
                color: greenColor,
                borderRadius: BorderRadius.circular(18),
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => const PembayaranBerhasilScreen()),
                    ),
                  );
                },
                child: Text(
                  'Bayar',
                  style: GoogleFonts.inter(
                    color: whiteColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
