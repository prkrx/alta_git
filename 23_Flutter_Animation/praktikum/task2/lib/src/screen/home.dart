import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_02/src/bloc/contact_cubit.dart';
import 'package:task_02/src/model/models.dart';
import 'package:task_02/src/transition/slide_route.dart';
import 'package:task_02/src/screen/form.dart';

class HomeScreen extends StatelessWidget {
  static const String route = '/';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kontak'),
      ),
      body: BlocBuilder<ContactCubit, List<ContactModel>>(
        builder: (context, state) {
          return BuildContactList(
            contacts: state,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            SlideRoute(
              routeName: FormScreen.route,
              page: const FormScreen(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class BuildContactList extends StatefulWidget {
  final List<ContactModel> contacts;

  const BuildContactList({
    super.key,
    required this.contacts,
  });

  @override
  State<BuildContactList> createState() => _BuildContactListState();
}

class _BuildContactListState extends State<BuildContactList> {
  final _name = TextEditingController();
  final _phone = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _name.dispose();
    _phone.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.contacts.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.group),
            Text('Kontak Kamu Kosong'),
          ],
        ),
      );
    }

    return ListView.separated(
      itemBuilder: (context, index) {
        var contact = widget.contacts[index];
        return ListTile(
          leading: CircleAvatar(
            child: Text(contact.name[0].toUpperCase()),
          ),
          title: Text(contact.name),
          subtitle: Text(contact.phone),
        );
      },
      separatorBuilder: (context, index) => const Divider(),
      itemCount: widget.contacts.length,
    );
  }
}
