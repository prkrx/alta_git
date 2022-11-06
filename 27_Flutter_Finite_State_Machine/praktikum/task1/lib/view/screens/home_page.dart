import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/menu_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        Provider.of<MenuProvider>(context, listen: false).getAllMenu();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final menuProvider = Provider.of<MenuProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: menuProvider.menu.length,
        itemBuilder: (context, index) {
          final menu = menuProvider.menu[index];
          return ListTile(
            title: Text(menu.name),
          );
        },
      ),
    );
  }
}
