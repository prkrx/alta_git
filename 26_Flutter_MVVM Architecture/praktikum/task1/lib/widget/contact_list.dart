import 'package:flutter/material.dart';
import 'package:task1/provider/contact_provider.dart';
import 'package:provider/provider.dart';

class ContactList extends StatelessWidget {
  const ContactList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ContactProvider>(
      builder: (BuildContext context, value, Widget? child) {
        return ListView.builder(
          itemCount: value.contakBook.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(value.contakBook[index][0]),
              subtitle: Text(value.contakBook[index][1]),
            );
          },
        );
      },
    );
  }
}
