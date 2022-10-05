import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mathalllevelsquizgame/Model/question_bank_model.dart';
import 'package:mathalllevelsquizgame/UI/about_view.dart';
import 'package:mathalllevelsquizgame/UI/notification_services.dart';
import 'package:mathalllevelsquizgame/UI/quiz_01.dart';
import 'package:mathalllevelsquizgame/UI/quiz_02.dart';
import 'package:mathalllevelsquizgame/UI/quiz_03.dart';
import 'package:mathalllevelsquizgame/UI/quiz_04.dart';
import 'package:mathalllevelsquizgame/UI/quiz_05.dart';
import 'package:mathalllevelsquizgame/UI/quiz_06.dart';
import 'package:mathalllevelsquizgame/UI/quiz_07.dart';
import 'package:mathalllevelsquizgame/UI/quiz_08.dart';
import 'package:mathalllevelsquizgame/UI/quiz_09.dart';
import 'package:mathalllevelsquizgame/UI/quiz_10.dart';
import 'package:mathalllevelsquizgame/UI/quiz_11.dart';
import 'package:mathalllevelsquizgame/UI/quiz_12.dart';
import 'package:mathalllevelsquizgame/UI/quiz_13.dart';
import 'package:mathalllevelsquizgame/UI/quiz_14.dart';
import 'package:mathalllevelsquizgame/UI/quiz_15.dart';
import 'package:mathalllevelsquizgame/UI/setting_view.dart';
import 'package:mathalllevelsquizgame/bloc/question_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:page_transition/page_transition.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  QuestionBloc questionBloc = QuestionBloc();

  QuestionBankModel questionBankModel = QuestionBankModel();

  void getData() async {
    questionBankModel = await questionBloc.questionBloc(context);
    setState(() {});
    NotificationService();
  }
  ValueNotifier<bool> isNotification = ValueNotifier(false);


  void android() async {
    var url = "https://play.google.com/store/";
    await canLaunch(url)
        ? launch(url)
        : print("Error to sending message in messenger");
  }


  @override
  void initState() {
    getData();
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
          "Choose Category",
          style:
              GoogleFonts.breeSerif(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: AnimationLimiter(
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
            itemCount: questionBankModel.question!.length,
            itemBuilder: (context, index) {
              return AnimationConfiguration.staggeredList(
                position: index,
                duration: const Duration(seconds: 1),
                child: SlideAnimation(
                  verticalOffset: 50.0,
                  child: FadeInAnimation(
                    child: GestureDetector(
                      onTap: () {
                        if (index == 0) {
                          Navigator.push(
                            context,
                            PageTransition(
                              duration: const Duration(seconds: 1),
                              curve: Curves.bounceIn,
                              type: PageTransitionType.rotate,
                              alignment: Alignment.topCenter,
                              child: Quiz01View(
                                colorData: int.parse(
                                    "${questionBankModel.question![index].categoryColor}"),
                                levelName:
                                '${questionBankModel.question![index].categoryName}',
                              )
                            ),
                          );
                        } else if (index == 1) {
                          Navigator.push(
                            context,
                            PageTransition(
                              duration: const Duration(seconds: 1),
                              curve: Curves.bounceIn,
                              type: PageTransitionType.rotate,
                              alignment: Alignment.topCenter,
                              child:Quiz02(
                                colorData: int.parse(
                                    "${questionBankModel.question![index].categoryColor}"),
                                levelName:
                                    '${questionBankModel.question![index].categoryName}',
                              ),
                            ),
                          );
                        } else if (index == 2) {
                          Navigator.push(
                            context,
                            PageTransition(
                              duration: const Duration(seconds: 1),
                              curve: Curves.bounceIn,
                              type: PageTransitionType.rotate,
                              alignment: Alignment.topCenter,
                              child: Quiz03View(
                                colorData: int.parse(
                                    "${questionBankModel.question![index].categoryColor}"),
                                levelName:
                                    '${questionBankModel.question![index].categoryName}',
                              ),
                            ),
                          );
                        } else if (index == 3) {
                          Navigator.push(
                            context,
                            PageTransition(
                              duration: const Duration(seconds: 1),
                              curve: Curves.bounceIn,
                              type: PageTransitionType.rotate,
                              alignment: Alignment.topCenter,
                              child: Quiz04View(
                                colorData: int.parse(
                                    "${questionBankModel.question![index].categoryColor}"),
                                levelName:
                                    '${questionBankModel.question![index].categoryName}',
                              ),
                            ),
                          );
                        } else if (index == 4) {
                          Navigator.push(
                            context,
                            PageTransition(
                              duration: const Duration(seconds: 1),
                              curve: Curves.bounceIn,
                              type: PageTransitionType.rotate,
                              alignment: Alignment.topCenter,
                              child: Quiz05View(
                                colorData: int.parse(
                                    "${questionBankModel.question![index].categoryColor}"),
                                levelName:
                                    '${questionBankModel.question![index].categoryName}',
                              ),
                            ),
                          );
                        } else if (index == 5) {
                          Navigator.push(
                            context,
                            PageTransition(
                              duration: const Duration(seconds: 1),
                              curve: Curves.bounceIn,
                              type: PageTransitionType.rotate,
                              alignment: Alignment.topCenter,
                              child: Quiz06View(
                                colorData: int.parse(
                                    "${questionBankModel.question![index].categoryColor}"),
                                levelName:
                                    '${questionBankModel.question![index].categoryName}',
                              ),
                            ),
                          );
                        } else if (index == 6) {
                          Navigator.push(
                            context,
                            PageTransition(
                              duration: const Duration(seconds: 1),
                              curve: Curves.bounceIn,
                              type: PageTransitionType.rotate,
                              alignment: Alignment.topCenter,
                              child: Quiz07View(
                                colorData: int.parse(
                                    "${questionBankModel.question![index].categoryColor}"),
                                levelName:
                                    '${questionBankModel.question![index].categoryName}',
                              ),
                            ),
                          );
                        } else if (index == 7) {
                          Navigator.push(
                            context,
                            PageTransition(
                              duration: const Duration(seconds: 1),
                              curve: Curves.bounceIn,
                              type: PageTransitionType.rotate,
                              alignment: Alignment.topCenter,
                              child: Quiz08View(
                                colorData: int.parse(
                                    "${questionBankModel.question![index].categoryColor}"),
                                levelName:
                                    '${questionBankModel.question![index].categoryName}',
                              ),
                            ),
                          );
                        } else if (index == 8) {
                          Navigator.push(
                            context,
                            PageTransition(
                              duration: const Duration(seconds: 1),
                              curve: Curves.bounceIn,
                              type: PageTransitionType.rotate,
                              alignment: Alignment.topCenter,
                              child: Quiz09View(
                                colorData: int.parse(
                                    "${questionBankModel.question![index].categoryColor}"),
                                levelName:
                                    '${questionBankModel.question![index].categoryName}',
                              ),
                            ),
                          );
                        } else if (index == 9) {
                          Navigator.push(
                            context,
                            PageTransition(
                              duration: const Duration(seconds: 1),
                              curve: Curves.bounceIn,
                              type: PageTransitionType.rotate,
                              alignment: Alignment.topCenter,
                              child: Quiz010View(
                                colorData: int.parse(
                                    "${questionBankModel.question![index].categoryColor}"),
                                levelName:
                                    '${questionBankModel.question![index].categoryName}',
                              ),
                            ),
                          );
                        } else if (index == 10) {
                          Navigator.push(
                            context,
                            PageTransition(
                              duration: const Duration(seconds: 1),
                              curve: Curves.bounceIn,
                              type: PageTransitionType.rotate,
                              alignment: Alignment.topCenter,
                              child: Quiz11View(
                                colorData: int.parse(
                                    "${questionBankModel.question![index].categoryColor}"),
                                levelName:
                                    '${questionBankModel.question![index].categoryName}',
                              ),
                            ),
                          );
                        } else if (index == 11) {
                          Navigator.push(
                            context,
                            PageTransition(
                              duration: const Duration(seconds: 1),
                              curve: Curves.bounceIn,
                              type: PageTransitionType.rotate,
                              alignment: Alignment.topCenter,
                              child: Quiz12View(
                                colorData: int.parse(
                                    "${questionBankModel.question![index].categoryColor}"),
                                levelName:
                                    '${questionBankModel.question![index].categoryName}',
                              ),
                            ),
                          );
                        } else if (index == 12) {
                          Navigator.push(
                            context,
                            PageTransition(
                              duration: const Duration(seconds: 1),
                              curve: Curves.bounceIn,
                              type: PageTransitionType.rotate,
                              alignment: Alignment.topCenter,
                              child: Quiz13View(
                                colorData: int.parse(
                                    "${questionBankModel.question![index].categoryColor}"),
                                levelName:
                                    '${questionBankModel.question![index].categoryName}',
                              ),
                            ),
                          );
                        } else if (index == 13) {
                          Navigator.push(
                            context,
                            PageTransition(
                              duration: const Duration(seconds: 1),
                              curve: Curves.bounceIn,
                              type: PageTransitionType.rotate,
                              alignment: Alignment.topCenter,
                              child: Quiz14View(
                                colorData: int.parse(
                                    "${questionBankModel.question![index].categoryColor}"),
                                levelName:
                                    '${questionBankModel.question![index].categoryName}',
                              ),
                            ),
                          );
                        } else if (index == 14) {
                          Navigator.push(
                            context,
                            PageTransition(
                              duration: const Duration(seconds: 1),
                              curve: Curves.bounceIn,
                              type: PageTransitionType.rotate,
                              alignment: Alignment.topCenter,
                              child: Quiz15View(
                                colorData: int.parse(
                                    "${questionBankModel.question![index].categoryColor}"),
                                levelName:
                                    '${questionBankModel.question![index].categoryName}',
                              ),
                            ),
                          );
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: h * 0.1,
                          width: w,
                          decoration: BoxDecoration(
                              color: Color(
                                int.parse(
                                    "${questionBankModel.question![index].categoryColor}"),
                              ),
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: w * 0.05,
                                  ),
                                  Image.asset(
                                    'assets/images/book.png',
                                    height: 50,
                                    width: 50,
                                  ),
                                  SizedBox(
                                    width: w * 0.1,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${questionBankModel.question![index].categoryName}",
                                        style: GoogleFonts.pangolin(
                                            color: Colors.white,
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "${questionBankModel.question![index].categoryDescription}",
                                        style: GoogleFonts.athiti(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const Padding(
                                padding: EdgeInsets.only(right: 5),
                                child: Icon(
                                  Icons.arrow_forward_ios_outlined,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }),
      ),
      drawer: Drawer(
        backgroundColor: Colors.transparent,
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
          ),
          child: Column(
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                ),
                child: Image.asset('assets/images/logo.png'),
              ),
              Expanded(
                child: ListView(
                  children: [
                    ListTile(
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          PageTransition(
                              duration: const Duration(seconds: 1),
                              curve: Curves.bounceIn,
                              type: PageTransitionType.rotate,
                              alignment: Alignment.topCenter,
                              child: const AboutView(),
                          ),
                        );
                      },
                      leading:
                      const Icon(Icons.info, color: Colors.white, size: 30),
                      title: Text(
                        'About',
                        style: GoogleFonts.breeSerif(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                    ListTile(
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          PageTransition(
                            duration: const Duration(seconds: 1),
                            curve: Curves.bounceIn,
                            type: PageTransitionType.rotate,
                            alignment: Alignment.topCenter,
                            child: const SettingView(),
                          ),
                        );
                      },
                      leading: const Icon(Icons.settings,
                          color: Colors.white, size: 30),
                      title: Text(
                        'Settings',
                        style: GoogleFonts.breeSerif(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                    ListTile(
                      onTap: () {
                         Navigator.pop(context);
                        Share.share('check out my website https://example.com');
                      },
                      title: Text(
                        "Share",
                        style: GoogleFonts.breeSerif(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      leading: const Icon(Icons.share,
                          color: Colors.white, size: 30),
                    ),
                    ListTile(
                      onTap: () {
                        Navigator.pop(context);
                        android();
                      },
                      leading: const Icon(Icons.more_horiz,
                          color: Colors.white, size: 30),
                      title: Text(
                        'More Apps',
                        style: GoogleFonts.breeSerif(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                color: Colors.white,
                width: double.infinity,
                height: 0.1,
              ),
              Container(
                padding: const EdgeInsets.all(10),
                height: 100,
                child: Text(
                  'V 1.0',
                  style: GoogleFonts.breeSerif(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
