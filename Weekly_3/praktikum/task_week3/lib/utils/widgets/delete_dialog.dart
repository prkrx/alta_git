import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/question_model.dart';
import 'package:task_week1/providers/question_provider.dart';
import '../../service.dart';

class DeleteDialog {
  Future<void> showDeleteDialog(BuildContext context) async {
    final provider = Provider.of<AskProvider>(context, listen: false);
    await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text('Apakah anda yakin ingin menghapusnnya ?'),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    provider.removeQuestion(AskModel());
                    Future.delayed(Duration(seconds: 4));
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => const Contact()));
                  },
                  child: Text('Iya')),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Tidak')),
            ],
          );
        });
  }
  
}