class Quiz02Model {
  bool? success;
  String? message;
  List<Questions>? questions;

  Quiz02Model({this.success, this.message, this.questions});

  Quiz02Model.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['Questions'] != null) {
      questions = <Questions>[];
      questions!.shuffle();
      json['Questions'].forEach((v) {
        questions!.add(Questions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (questions != null) {
      data['Questions'] = questions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Questions {
  String? points;
  String? answer;
  String? durationInSeconds;
  String? question;
  String? negativePoints;
  String? questionType;
  String? wrongAnsExplanation;
  List<String>? options;

  Questions(
      {this.points,
      this.answer,
      this.durationInSeconds,
      this.question,
      this.negativePoints,
      this.questionType,
      this.wrongAnsExplanation,
      this.options});

  Questions.fromJson(Map<String, dynamic> json) {
    points = json['points'];
    answer = json['Answer'];
    durationInSeconds = json['duration_in_seconds'];
    question = json['question'];
    negativePoints = json['negative_points'];
    questionType = json['question_type'];
    wrongAnsExplanation = json['wrong_ans_explanation'];
    options = json['options'].cast<String>();
    options!.shuffle();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['points'] = points;
    data['Answer'] = answer;
    data['duration_in_seconds'] = durationInSeconds;
    data['question'] = question;
    data['negative_points'] = negativePoints;
    data['question_type'] = questionType;
    data['wrong_ans_explanation'] = wrongAnsExplanation;
    data['options'] = options;
    return data;
  }
}
