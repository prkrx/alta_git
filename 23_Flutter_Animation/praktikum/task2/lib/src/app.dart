import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/contact_cubit.dart';
import 'screen/form.dart';
import 'screen/home.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ContactCubit(),
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          HomeScreen.route: (_) => const HomeScreen(),
          FormScreen.route: (_) => const FormScreen(),
        },
      ),
    );
  }
}
