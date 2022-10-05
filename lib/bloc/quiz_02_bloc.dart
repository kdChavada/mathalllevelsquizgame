import 'package:flutter/material.dart';
import 'package:mathalllevelsquizgame/Model/quiz_02.dart';
import 'package:mathalllevelsquizgame/db/quiz_db.dart';

class Quiz02Bloc {
  Future<Quiz02Model> questionBloc(BuildContext mContext) async {
    return Quiz02Model.fromJson(quiz02);
  }
}
