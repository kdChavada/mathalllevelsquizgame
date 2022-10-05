import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:mathalllevelsquizgame/UI/home_view.dart';
import 'package:mathalllevelsquizgame/helper/constant.dart';

class LevelComplete extends StatefulWidget {
  String  leval;
   LevelComplete({Key? key,required this.leval}) : super(key: key);

  @override
  State<LevelComplete> createState() => _LevelCompleteState();
}

class _LevelCompleteState extends State<LevelComplete> {
  @override
  Widget build(BuildContext context) {
    double h =  MediaQuery.of(context).size.height;
    double w =  MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.green,
        leading: GestureDetector(
            onTap: (){
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                 const HomeView()), (Route<dynamic> route) => false);

            },
            child: const Icon(Icons.arrow_back_ios_new_outlined,size: 30,)),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Text(
                "${widget.leval} Complete",
                style: GoogleFonts.rye(color: Colors.black, fontSize: 45),
              ),
              SizedBox(height: h*.05,),
              Image.asset('assets/images/highscore.png',
              height: 200, width: 200,
              ),
              SizedBox(height: h*.05,),
              Text(
                "Score",
                style: GoogleFonts.rye(color: Colors.black, fontSize: 45),
              ),
              SizedBox(height: h*.05,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("${countScore.value}",style: GoogleFonts.rye(color: Colors.black, fontSize: 45),),
                  Text("/",style: GoogleFonts.rye(color: Colors.black, fontSize: 45),),
                  Text("100",style: GoogleFonts.rye(color: Colors.black, fontSize: 45),),
                ],
              ),


              SizedBox(height: h*.05,),

              Text(
                "Congratulations",
                style: GoogleFonts.rye(color: Colors.black, fontSize: 45),
              ),


              SizedBox(height: h*.05,),

            ],
          ),
          SizedBox(
            height: h,
            width: w,
            child: Lottie.asset('assets/images/62717-confetti.json',
            fit: BoxFit.cover
            ),
          ),
        ],
      ),
    );
  }
}
