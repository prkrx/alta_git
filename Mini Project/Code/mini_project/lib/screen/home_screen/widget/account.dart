import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_project/provider/login_user_provider.dart';
import 'package:mini_project/screen/login_screen/login_screen.dart';
import 'package:mini_project/theme.dart';
import 'package:provider/provider.dart';

Widget account(BuildContext context) {
  final authProvider =
      Provider.of<LoginUserProvider>(context, listen: false).user;
  return Padding(
    padding: const EdgeInsets.all(kDefaultPadding),
    child: Column(
      children: [
        const CircleAvatar(
          radius: 50,
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          authProvider.email,
          style: GoogleFonts.inter(fontSize: 12, color: greyColor),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          authProvider.name,
          style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 150,
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const LoginScreen(),
              ),
            );
          },
          child: Text(
            'Logout',
            style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          style: ElevatedButton.styleFrom(
            primary: greenColor,
            fixedSize: const Size(200, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),
      ],
    ),
  );
}
