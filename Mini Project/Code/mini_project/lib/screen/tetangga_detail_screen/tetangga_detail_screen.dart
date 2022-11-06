import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:mini_project/model/user_data_model.dart';
import 'package:mini_project/theme.dart';

class TetanggaDetailScreen extends StatelessWidget {
  const TetanggaDetailScreen({
    Key? key,
    required this.userDataModel,
  }) : super(key: key);
  final UserDataModel userDataModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tetangga',
          style: GoogleFonts.inter(fontWeight: FontWeight.w500),
        ),
        backgroundColor: greenColor,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(kDefaultPadding),
            ),
            CircleAvatar(
              backgroundImage: NetworkImage(
                userDataModel.avatar,
              ),
              radius: 100,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              userDataModel.email,
              style: GoogleFonts.inter(
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              '${userDataModel.firstName} ${userDataModel.lastName}',
              style:
                  GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
