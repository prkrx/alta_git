import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/account_cubit.dart';
import 'screen/home.dart';
import 'screen/register.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AccountCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: RegisterScreen.route,
        routes: {
          HomeScreen.route: (context) => const HomeScreen(),
          RegisterScreen.route: (context) => const RegisterScreen(),
        },
      ),
    );
  }
}
