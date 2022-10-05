import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mathalllevelsquizgame/UI/notification_services.dart';

class SettingView extends StatefulWidget {
  const SettingView({Key? key}) : super(key: key);

  @override
  State<SettingView> createState() => _SettingViewState();
}

class _SettingViewState extends State<SettingView> {
  ValueNotifier<bool> notificationValue = ValueNotifier(false);

  ValueNotifier<int> selectMode = ValueNotifier(1);

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.green,
        title: Text(
          "Setting",
          style:
              GoogleFonts.breeSerif(fontWeight: FontWeight.bold, fontSize: 30),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.notifications_on_sharp, size: 30),
                    SizedBox(
                      width: w * 0.05,
                    ),
                    Text(
                      "Notification",
                      style: GoogleFonts.kiteOne(
                          color: Colors.black, fontSize: 25),
                    ),
                  ],
                ),
                ValueListenableBuilder(
                    valueListenable: notificationValue,
                    builder: (
                      context,
                      v,
                      c,
                    ) {
                      return CupertinoSwitch(
                          value: notificationValue.value,
                          onChanged: (val) {
                            notificationValue.value = val;
                            NotificationService();
                          });
                    })
              ],
            ),
            SizedBox(height: h*0.05,),
            Text("Mode",style: GoogleFonts.kiteOne(
                color: Colors.black, fontSize: 25),),
            SizedBox(height: h*0.05,),
            ValueListenableBuilder(
                valueListenable: selectMode,
                builder: (context, v, c) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      selectMode.value == 1
                          ? GestureDetector(
                              onTap: () {

                              },
                              child: Container(
                                height: h * 0.2,
                                width: w * 0.4,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15)),
                                child: const Center(
                                    child: Icon(
                                  Icons.check,
                                  color: Colors.green,
                                  size: 50,
                                )),
                              ),
                            )
                          : GestureDetector(
                              onTap: () {
                                selectMode.value = 1;
                                selectMode.notifyListeners();
                              },
                              child: Container(
                                height: h * 0.2,
                                width: w * 0.4,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15)),
                                child: Center(
                                  child: Text(
                                    "Light",
                                    style: GoogleFonts.kiteOne(
                                        color: Colors.black, fontSize: 25),
                                  ),
                                ),
                              ),
                            ),
                      const SizedBox(
                        width: 18,
                      ),
                      selectMode.value == 2
                          ? GestureDetector(
                              onTap: () {
                                // selectMode.value = 0;
                                // selectMode.notifyListeners();
                              },
                              child: Container(
                                height: h * 0.2,
                                width: w * 0.4,
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(15)),
                                child: const Center(
                                    child: Icon(
                                  Icons.check,
                                  color: Colors.green,
                                  size: 50,
                                )),
                              ),
                            )
                          : GestureDetector(
                              onTap: () {
                                selectMode.value = 2;
                                selectMode.notifyListeners();

                              },
                              child: Container(
                                height: h * 0.2,
                                width: w * 0.4,
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(15)),
                                child: Center(
                                  child: Text(
                                    "Dark",
                                    style: GoogleFonts.kiteOne(
                                        color: Colors.white, fontSize: 25),
                                  ),
                                ),
                              ),
                            ),
                    ],
                  );
                }),

          ],
        ),
      ),
    );
  }
}
