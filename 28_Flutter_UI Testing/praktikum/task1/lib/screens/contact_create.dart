import 'package:flutter/material.dart';
import '../provider/contact_provider.dart';
import 'home_page.dart';
import 'package:provider/provider.dart';

class ContactCreate extends StatefulWidget {
  const ContactCreate({Key? key}) : super(key: key);

  @override
  State<ContactCreate> createState() => _ContactCreateState();
}

class _ContactCreateState extends State<ContactCreate> {
  var nameController = TextEditingController();
  var numberController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    numberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ContactProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Create'),
        centerTitle: true,
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              TextFormField(
                controller: nameController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Masukkan Nama';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Name'),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: numberController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Masukkan Nama';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Number'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    final result = await provider.api.tambahContact(
                        name: nameController.text,
                        number: numberController.text);
                    if (result == true) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Nomer baru telah ditambah')),
                      );
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePage()),
                      );
                    }
                  }
                },
                child: const Text('Add Number'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
