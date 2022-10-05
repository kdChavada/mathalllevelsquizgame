import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mathalllevelsquizgame/UI/home_view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  startTime() async {
    var duration = const Duration(seconds: 4);
    return Timer(duration, route);
  }

  route() {
    Navigator.pushAndRemoveUntil<void>(
      context,
      MaterialPageRoute<void>(
        builder: (BuildContext context) => const HomeView(),
      ),
      (Route<dynamic> route) => false,
    );
  }

  @override
  void initState() {
    startTime();
    _controller = AnimationController(
      duration: const Duration(
        seconds: 2,
      ),
      vsync: this,
      value: 0.1,
    )..repeat(reverse: true);
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.linear,
    );
    super.initState();
  }

  @override
  dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/bg.jpg',
            height: h,
            width: w,
            fit: BoxFit.cover,
          ),
          Center(
            child: ScaleTransition(
              scale: _animation,
              child: Image.asset('assets/images/logo.png'),
            ),
          ),
        ],
      ),
    );
  }
}
