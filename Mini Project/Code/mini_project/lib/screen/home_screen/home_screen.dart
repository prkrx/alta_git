import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mini_project/model/articel_model.dart';
import 'package:mini_project/model/user_data_model.dart';
import 'package:mini_project/provider/articel_provider.dart';
import 'package:mini_project/provider/login_user_provider.dart';
import 'package:mini_project/provider/user_data_provider.dart';
import 'package:mini_project/screen/articel_screen/articel_screen.dart';
import 'package:mini_project/screen/home_screen/widget/account.dart';
import 'package:mini_project/screen/home_screen/widget/berita_widget.dart';
import 'package:mini_project/screen/home_screen/widget/tetangga_widget.dart';
import 'package:mini_project/screen/riwayat_screen/riwayat_screen.dart';
import 'package:mini_project/theme.dart';
import 'package:provider/provider.dart';

import '../tagihan_screen/tagihan_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final _provider =
        Provider.of<UserDataProvider>(context, listen: false).getDataAllUser();
    final articelProvider =
        Provider.of<ArticelProvider>(context, listen: false).getAllArticel();
    final authProvider =
        Provider.of<LoginUserProvider>(context, listen: false).user;
    return Scaffold(
      backgroundColor: backGroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  margin: const EdgeInsets.only(bottom: 50),
                  decoration: const BoxDecoration(
                    color: greenColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(36),
                      bottomRight: Radius.circular(36),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 50,
                      left: 20,
                      right: 20,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                Text(
                              "Selamat Datang, ${authProvider.name}",
                              style: GoogleFonts.inter(
                                  color: whiteColor,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                            IconButton(
                              onPressed: () {
                                showModalBottomSheet(
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(20),
                                  )),
                                  context: context,
                                  builder: (context) => account(context),
                                );
                              },
                              icon: const Icon(
                                Icons.account_circle,
                                color: whiteColor,
                                size: 50,
                              ),
                            ),
                              ],
                            )
                            
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                      
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: kDefaultPadding,
                  right: kDefaultPadding,
                  child: Container(
                    height: 100,
                    width: 400,
                    decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 20, left: 35, right: 35),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const TagihanScreen(),
                                    ),
                                  );
                                },
                                child: SvgPicture.asset(
                                  'assets/icons/file-minus.svg',
                                  width: 50,
                                  height: 50,
                                  color: greenColor,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              const Text('Tagihan'),
                            ],
                          ),
                          const SizedBox(width: 55),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Riwayat(),
                                ),
                              );
                            },
                            child: Column(
                              children: [
                                SvgPicture.asset(
                                  'assets/icons/file-text.svg',
                                  width: 50,
                                  height: 50,
                                  color: greenColor,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                const Text('Riwayat')
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(kDefaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Tetangga',
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  FutureBuilder(
                    future: _provider,
                    builder: (BuildContext context,
                        AsyncSnapshot<dynamic> snapshot) {
                      if (snapshot.hasData) {
                        List<UserDataModel>? userData = snapshot.data;
                        return GridView.builder(
                          physics: const ScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 20,
                            mainAxisExtent: 100,
                          ),
                          itemCount: userData!.length,
                          itemBuilder: (context, index) {
                            return tetanggaWidget(userData[index], context);
                          },
                        );
                      }
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  ),
                  Row(
                    children: [
                      Text(
                        'Berita RT',
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        width: 190,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (
                                context,
                                Animation<double> animation,
                                Animation<double> secondaryAnimation,
                              ) =>
                                  const ArticelScreen(),
                              transitionDuration: const Duration(seconds: 1),
                              transitionsBuilder: (
                                context,
                                Animation<double> animation,
                                Animation<double> secondaryAnimation,
                                Widget child,
                              ) =>
                                  FadeTransition(
                                opacity: animation,
                                child: child,
                              ),
                            ),
                          );
                        },
                        child: Text(
                          'Lihat semua',
                          style: GoogleFonts.inter(
                            color: greenColor.withOpacity(0.6),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: FutureBuilder(
                      future: articelProvider,
                      builder: (BuildContext context,
                          AsyncSnapshot<dynamic> snapshot) {
                        if (snapshot.hasData) {
                          List<Articel>? articles = snapshot.data;
                          return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: articles!.length,
                            itemBuilder: (context, index) => beritaWidget(
                              articles[index],
                              context,
                            ),
                          );
                        }
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
