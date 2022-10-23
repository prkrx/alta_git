import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/providers/question_provider.dart';
import '/utils/widgets/delete_dialog.dart';

class MsgHistory extends StatelessWidget {
  const MsgHistory({Key key}) : super(key: key);

  Widget body(BuildContext context) {
    final provider = Provider.of<AskProvider>(context, listen: false);
    return ListView.builder(
        itemCount: provider.nanya.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(provider.nanya[index].email),
            subtitle: Text(provider.nanya[index].msg),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('History'),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              color: Color.fromARGB(100, 6, 100, 255)
              ),
        ),
        actions: [
          IconButton(
              onPressed: () async {
                await DeleteDialog().showDeleteDialog(context);
                // await showDeleteDialog(context);
              },
              icon: Icon(Icons.delete_outline))
        ],
      ),
      body: body(context)
    );
  }
}
