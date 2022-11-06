import 'package:flutter/material.dart';
import 'package:mini_project/provider/articel_provider.dart';
import 'package:mini_project/provider/login_user_provider.dart';
import 'package:mini_project/provider/user_data_provider.dart';
import 'package:mini_project/screen/login_screen/login_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LoginUserProvider>(
          create: ((_) => LoginUserProvider()),
        ),
        ChangeNotifierProvider<UserDataProvider>(
          create: ((_) => UserDataProvider()),
        ),
        ChangeNotifierProvider<ArticelProvider>(
          create: ((_) => ArticelProvider()),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Manajemen Financial',
        home: LoginScreen(),
      ),
    );
  }
}
