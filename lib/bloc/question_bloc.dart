import 'package:flutter/material.dart';
import 'package:mathalllevelsquizgame/Model/question_bank_model.dart';
import 'package:mathalllevelsquizgame/db/data_base.dart';

class QuestionBloc{

  Future<QuestionBankModel> questionBloc(BuildContext mContext)async {
    return QuestionBankModel.fromJson(questionBank);
  }
}