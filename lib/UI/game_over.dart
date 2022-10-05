import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:mathalllevelsquizgame/UI/home_view.dart';
import 'package:mathalllevelsquizgame/helper/constant.dart';

class GameOver extends StatefulWidget {
  const GameOver({Key? key}) : super(key: key);

  @override
  State<GameOver> createState() => _GameOverState();
}

class _GameOverState extends State<GameOver> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.green,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const HomeView()),
                (Route<dynamic> route) => false);
          },
          child: const Icon(
            Icons.arrow_back_ios_new_outlined,
            size: 30,
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              "Game Over",
              style: GoogleFonts.rye(color: Colors.black, fontSize: 45),
            ),
            SizedBox(
              height: 300,
              width: 300,
              child: Lottie.asset('assets/images/56285-emoji-35.json'),
            ),
            Text(
              "Score",
              style: GoogleFonts.rye(color: Colors.black, fontSize: 45),
            ),
            SizedBox(
              height: h * .05,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${countScore.value}",
                  style: GoogleFonts.rye(color: Colors.black, fontSize: 45),
                ),
                Text(
                  "/",
                  style: GoogleFonts.rye(color: Colors.black, fontSize: 45),
                ),
                Text(
                  "100",
                  style: GoogleFonts.rye(color: Colors.black, fontSize: 45),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
