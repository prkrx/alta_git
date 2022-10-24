import 'package:flutter/material.dart';
import '../models/question_model.dart';

class AskProvider with ChangeNotifier{
  final List<AskModel> _questions = [];
  List<AskModel> get nanya => _questions;

  void addQuestionInfo (AskModel qestion){
    _questions.add(qestion);
    notifyListeners();
  }

  Future<void> removeQuestion (AskModel qestion) async {
    await Future.delayed(Duration(seconds: 4));
    _questions.clear();
    notifyListeners();
  }
}