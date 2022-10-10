import 'package:crud_bloc/models/contact.dart';
import 'package:crud_bloc/presentation/create_contact_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/contact_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contacts'),
      ),
      body: BlocBuilder<ContactBloc, ContactState>(
        builder: (context, state) {
          if (state is ContactLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ContactLoaded) {
            if (state.data.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.people_alt_outlined),
                    Text('Your contact is empty'),
                  ],
                ),
              );
            } else {
              return ListView.builder(
                itemCount: state.data.length,
                itemBuilder: (context, index) {
                  Contact contact = state.data[index];
                  return Card(
                    child: ListTile(
                      leading: const CircleAvatar(
                        child: Icon(Icons.people),
                      ),
                      title: Text(contact.name),
                      subtitle: Text(contact.phoneNumber),
                      trailing: IconButton(
                        onPressed: () {
                          BlocProvider.of<ContactBloc>(context).add(
                            DeleteContactList(id: contact.id),
                          );
                        },
                        icon: const Icon(Icons.delete),
                      ),
                    ),
                  );
                },
              );
            }
          }
          return Container();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CreateContactScreen(),
            ),
          ).then(
            (value) =>
                BlocProvider.of<ContactBloc>(context).add(GetContactList()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
