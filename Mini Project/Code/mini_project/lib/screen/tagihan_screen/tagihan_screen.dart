import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_project/provider/login_user_provider.dart';
import 'package:mini_project/screen/tagihan_screen/widget/button.dart';
import 'package:mini_project/screen/tagihan_screen/widget/keterangan.dart';
import 'package:mini_project/screen/tagihan_screen/widget/tagihan_widget.dart';
import 'package:mini_project/theme.dart';
import 'package:provider/provider.dart';

class TagihanScreen extends StatefulWidget {
  const TagihanScreen({Key? key}) : super(key: key);

  @override
  State<TagihanScreen> createState() => _TagihanScreenState();
}

class _TagihanScreenState extends State<TagihanScreen> {
  String tagihan = "Tagihan";
  @override
  Widget build(BuildContext context) {
    final authProvider =
        Provider.of<LoginUserProvider>(context, listen: false).user;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          tagihan,
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        backgroundColor: greenColor,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(kDefaultPadding),
        child: Column(
          children: [
            Container(
              width: 400,
              height: 165,
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: greyColor.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                children: [
                  const Padding(padding: EdgeInsets.only(top: 20)),
                  Text(
                    'Keterangan',
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(
                    thickness: 1,
                  ),
                  Keterangan(
                    keterangan: 'Nama',
                    jenis: authProvider.name,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Keterangan(
                    keterangan: 'Blok',
                    jenis: 'A2',
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Keterangan(
                    keterangan: 'No. Rumah',
                    jenis: '8',
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Keterangan(
                    keterangan: 'RT/RW',
                    jenis: '02/10',
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Container(
              width: 400,
              height: 300,
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: greyColor.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(kDefaultPadding),
                    child: Row(
                      children: [
                        Text(
                          'Tagihan',
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          width: 222,
                        ),
                        Text(
                          'Total',
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 1,
                  ),
                  const TagihanWidget(
                    keterangan: 'Uang Jalan Bulan \nAgustus 2022',
                    total: 'Rp. 50.000',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const TagihanWidget(
                    keterangan: 'Uang Kas Bulan \nJanuari 2022',
                    total: 'Rp. 25.000',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const TagihanWidget(
                    keterangan: 'Uang Sampah Bulan \nJuni 2021',
                    total: 'Rp. 75.000',
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Divider(
              thickness: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total Pembayaran',
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Rp. 150.000',
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            const ButtonWidget()
          ],
        ),
      ),
    );
  }
}
