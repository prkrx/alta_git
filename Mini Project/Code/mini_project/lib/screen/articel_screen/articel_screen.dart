import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_project/model/articel_model.dart';
import 'package:mini_project/provider/articel_provider.dart';
import 'package:mini_project/screen/articel_screen/widget/articel_widget.dart';
import 'package:mini_project/theme.dart';
import 'package:provider/provider.dart';

class ArticelScreen extends StatefulWidget {
  const ArticelScreen({Key? key}) : super(key: key);

  @override
  State<ArticelScreen> createState() => _ArticelScreenState();
}

class _ArticelScreenState extends State<ArticelScreen> {
  @override
  Widget build(BuildContext context) {
    final articelProvider =
        Provider.of<ArticelProvider>(context, listen: false).getAllArticel();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Berita',
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        backgroundColor: greenColor,
      ),
      body: FutureBuilder(
        future: articelProvider,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            List<Articel>? articles = snapshot.data;
            return ListView.builder(
              itemCount: articles!.length,
              itemBuilder: (context, index) =>
                  listTileWidget(articles[index], context),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
