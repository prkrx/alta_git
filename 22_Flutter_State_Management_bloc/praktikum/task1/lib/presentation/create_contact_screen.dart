import 'package:crud_bloc/bloc/contact_bloc.dart';
import 'package:crud_bloc/models/contact.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateContactScreen extends StatelessWidget {
  CreateContactScreen({super.key});
  final nameC = TextEditingController();
  final numberC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Contact'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: nameC,
              decoration: const InputDecoration(
                label: Text('Name'),
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),
            TextField(
              controller: numberC,
              decoration: const InputDecoration(
                label: Text('Phone Number'),
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),
            ElevatedButton(
              onPressed: () {
                BlocProvider.of<ContactBloc>(context).add(
                  CreateContactList(
                    contact: Contact(
                      id: '${nameC.text}${numberC.text}',
                      name: nameC.text,
                      phoneNumber: numberC.text,
                    ),
                  ),
                );
                Navigator.pop(context);
              },
              child: const Text('CREATE CONTACT'),
            ),
          ],
        ),
      ),
    );
  }
}
