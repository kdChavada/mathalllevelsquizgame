import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutView extends StatefulWidget {
  const AboutView({Key? key}) : super(key: key);

  @override
  State<AboutView> createState() => _AboutViewState();
}

class _AboutViewState extends State<AboutView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: Text(
          "About",
          style: GoogleFonts.breeSerif(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Text(
                "Math Quiz for all.Test your mental ability, Train your brain for calculation. Play math quiz fun and education,",
                style: GoogleFonts.kiteOne(color: Colors.black, fontSize: 25),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 15,),
              Text(
                "Math Quiz is a free fun quiz game that aims to improve your math skill and train your brain. Addition, Subtraction, Multiplication, and Division are all included in Math Quiz. Learning Math was never so much fun for kids to spend family time together. Besides, advanced math puzzles such as math formulas, figures, and tons of other math trivia are available for adults. To sum up, Math Quiz is a fun educational game and suitable for all ages who love math!",
                style: GoogleFonts.kiteOne(color: Colors.black, fontSize: 25),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 15,),
              Text(
                "Great educational app for parents to help children to learn faster",
                style: GoogleFonts.kiteOne(color: Colors.black, fontSize: 25),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 15,),
              Text(
                "Single-player play offline math trivia at any time.",
                style: GoogleFonts.kiteOne(color: Colors.black, fontSize: 25),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 15,),
              Text(
                "Brain-training trivia and cool number games are a smart way to improve your math knowledge",
                style: GoogleFonts.kiteOne(color: Colors.black, fontSize: 25),
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//
// Math Quiz is a free fun quiz game that aims to improve your math skill and train your brain. Addition, Subtraction, Multiplication, and Division are all included in Math Quiz. Learning Math was never so much fun for kids to spend family time together. Besides, advanced math puzzles such as math formulas, figures, and tons of other math trivia are available for adults. To sum up, Math Quiz is a fun educational game and suitable for all ages who love math!
//
// WHY MATH QUIZ
// 📕 A comprehensive handbook to test your math knowledge;
// 📕 Quizzes about multiplication, division, addition, and subtraction; Exponential and square root; figures;
// 📕 The essential math knowledge test for people of all ages;
// 📕 Brain-training trivia and cool number games are a smart way to improve your math knowledge;
// 📕 Great educational app for parents to help children to learn faster.
// 📕 An excellent free game for teachers to enrich the teaching.
//
// FEATURES
// 📕 Easy to start with but hard to level up. Do you really MASTER the number game?
// 📕 Play this math trivia game with gentle music and an enjoyable user interface;
// 📕 Cool trivia suitable for all the people who are interested in mathematics;
// 📕 Useful props will help you out when you meet the hard test;
// 📕 Mysterious reward after each winning chapter;
// 📕 Single-player play offline math trivia at any time.
//
// HOW TO PLAY
// 📕 Tap the RIGHT answer button from the 4 multiple choices;
// 📕 You need to catch the Right answer in 20 seconds; Can you ace it?
// 📕 There are 3 quizzes for each level, and a mysterious reward for you after the whole level is finished;
// 📕 Use "Light" to remove a wrong answer; Use "Diamonds" to buy 20 seconds more if your time is used up.