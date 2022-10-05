import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mathalllevelsquizgame/Model/quiz_01.dart';
import 'package:mathalllevelsquizgame/UI/game_over.dart';
import 'package:mathalllevelsquizgame/UI/level_complate.dart';
import 'package:mathalllevelsquizgame/bloc/quiz_01_bloc.dart';
import 'package:mathalllevelsquizgame/helper/constant.dart';

class Quiz08View extends StatefulWidget {
  int colorData;
  String levelName;

  Quiz08View({Key? key, required this.colorData, required this.levelName})
      : super(key: key);

  @override
  State<Quiz08View> createState() => _Quiz08ViewState();
}

class _Quiz08ViewState extends State<Quiz08View> {
  Quiz08Bloc quiz01bloc = Quiz08Bloc();

  Quiz01Model quiz01model = Quiz01Model();

  void getData() async {
    quiz01model = await quiz01bloc.questionBloc(context);
    setState(() {});
  }

  ValueNotifier<int> questionNo = ValueNotifier(0);

  @override
  void initState() {
    getData();
    countScore.value = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.green,
        title: Text(
          "Quiz ${widget.levelName}",
          style:
              GoogleFonts.breeSerif(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: ValueListenableBuilder(
          valueListenable: questionNo,
          builder: (context, v, c) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Container(
                    height: h * 0.1,
                    width: w,
                    decoration: BoxDecoration(
                        color: Color(widget.colorData),
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Container(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Text(
                          "${quiz01model.questions![questionNo.value].question}",
                          textScaleFactor: 0.85,
                          style: GoogleFonts.kiteOne(
                              color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: quiz01model
                          .questions![questionNo.value].options!.length,
                      itemBuilder: (context, j) {
                        return GestureDetector(
                          onTap: () {
                            if (quiz01model
                                    .questions![questionNo.value].answer ==
                                quiz01model
                                    .questions![questionNo.value].options![j]) {
                              if (questionNo.value ==
                                  quiz01model.questions!.length - 1) {
                                //Score Screen
                                countScore.value += 10;
                                countScore.notifyListeners();
                                print("Level Over");

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LevelComplete(
                                      leval: widget.levelName,
                                    ),
                                  ),
                                );
                              } else {
                                questionNo.value += 1;
                                countScore.value += 10;
                                countScore.notifyListeners();
                                print(countScore.value);
                                questionNo.notifyListeners();
                              }
                            } else {
                              //Score Screen
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const GameOver()));
                              print("Game Over");
                              print(countScore.value);
                            }
                          },
                          child: Container(
                            margin: const EdgeInsets.only(
                              top: 15,
                            ),
                            height: h * 0.1,
                            width: w,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.purple),
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                              child: Container(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                child: Text(
                                  quiz01model
                                      .questions![questionNo.value].options![j],
                                  textScaleFactor: 0.85,
                                  style: GoogleFonts.rye(
                                      color: Colors.black, fontSize: 20),
                                ),
                              ),
                            ),
                          ),
                        );
                      })
                ],
              ),
            );
          }),
    );
  }
}
