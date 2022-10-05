import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mathalllevelsquizgame/Model/quiz_02.dart';
import 'package:mathalllevelsquizgame/UI/game_over.dart';
import 'package:mathalllevelsquizgame/UI/level_complate.dart';
import 'package:mathalllevelsquizgame/bloc/quiz_02_bloc.dart';
import 'package:mathalllevelsquizgame/helper/constant.dart';

class Quiz02 extends StatefulWidget {
  int colorData;
  String levelName;
    Quiz02({Key? key,required  this.levelName,required this.colorData}) : super(key: key);

  @override
  State<Quiz02> createState() => _Quiz02State();
}

class _Quiz02State extends State<Quiz02> {


  ValueNotifier<int> questionNo = ValueNotifier(0);




  Quiz02Bloc quiz02bloc =  Quiz02Bloc();

  Quiz02Model  quiz02model =  Quiz02Model();

  void  getData() async{

    quiz02model =  await  quiz02bloc.questionBloc(context);
    setState(() {

    });


  }





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
                          "${quiz02model.questions![questionNo.value].question}",
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
                      itemCount: quiz02model
                          .questions![questionNo.value].options!.length,
                      itemBuilder: (context, j) {
                        return GestureDetector(
                          onTap: () {
                            if (quiz02model
                                .questions![questionNo.value].answer ==
                                quiz02model
                                    .questions![questionNo.value].options![j]) {
                              if (questionNo.value ==
                                  quiz02model.questions!.length - 1) {
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
                                  quiz02model
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
