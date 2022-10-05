class QuestionBankModel {
  bool? success;
  String? message;
  List<Question>? question;

  QuestionBankModel({this.success, this.message, this.question});

  QuestionBankModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['question'] != null) {
      question = <Question>[];
      json['question'].forEach((v) {
        question!.add(Question.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (question != null) {
      data['question'] = question!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Question {
  String? categoryColor;
  bool? timerRequired;
  String? categoryId;
  String? categoryName;
  String? leaderboardId;
  String? categoryDescription;
  String? categoryImagePath;
  String? categoryQuestionsMaxLimit;

  Question(
      {this.categoryColor,
        this.timerRequired,
        this.categoryId,
        this.categoryName,
        this.leaderboardId,
        this.categoryDescription,
        this.categoryImagePath,
        this.categoryQuestionsMaxLimit});

  Question.fromJson(Map<String, dynamic> json) {
    categoryColor = json['category_color'];
    timerRequired = json['timer_required'];
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    leaderboardId = json['leaderboard_id'];
    categoryDescription = json['category_description'];
    categoryImagePath = json['category_image_path'];
    categoryQuestionsMaxLimit = json['category_questions_max_limit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['category_color'] = categoryColor;
    data['timer_required'] = timerRequired;
    data['category_id'] = categoryId;
    data['category_name'] = categoryName;
    data['leaderboard_id'] = leaderboardId;
    data['category_description'] = categoryDescription;
    data['category_image_path'] = categoryImagePath;
    data['category_questions_max_limit'] = categoryQuestionsMaxLimit;
    return data;
  }
}
