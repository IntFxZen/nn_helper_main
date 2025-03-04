import 'dart:ui';
import 'package:flutter/material.dart';
import '../screens/events.dart';

void eventsDialog(BuildContext context, index) {
  showGeneralDialog(
      barrierColor: Colors.white10,
      transitionBuilder: (context, a1, a2, widget) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: ScaleTransition(
              scale: Tween<double>(begin: 0.5, end: 1.0).animate(a1),
              child: FadeTransition(
                opacity: Tween<double>(begin: 0.5, end: 1.0).animate(a1),
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 35),
                  child: Dialog(
                    insetAnimationDuration: Duration(seconds: 3),
                    insetPadding: EdgeInsets.zero,
                    backgroundColor: Color.lerp(
                        backgroundColors[index].color, Colors.white, 0.8),
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 5),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.network(
                                    fit: BoxFit.cover,
                                    cinema[index]["img"])),
                          ),
                          Container(
                            margin: const EdgeInsets.only(
                                top: 8, bottom: 5, left: 10, right: 10),
                            child: Text(
                              cinema[index]["title"],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: colors[index].color,
                                  fontSize: 27,
                                  fontWeight: FontWeight.w900),
                            ),
                          ),
                          if (cinema[index]['subTitle'] != '') ...{
                            Container(
                              margin: const EdgeInsets.only(
                                  bottom: 10, left: 10, right: 10),
                              child: Text(
                                cinema[index]["subTitle"],
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: colors[index].color,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w900),
                              ),
                            )
                          },
                          Container(
                            constraints: const BoxConstraints(
                              maxHeight: 300, // Максимальная высота контейнера
                            ),
                            margin: const EdgeInsets.symmetric(horizontal: 15),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Text(
                                cinema[index]["details"],
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 16),
                              ),
                            ),
                          ),
                          Text(
                            "Жанр: ${cinema[index]["tags"]}",
                            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Год и страна: ${cinema[index]["yearAndContries"]}",
                            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )),
        );
      },
      transitionDuration: const Duration(milliseconds: 200),

      barrierDismissible: true,
      barrierLabel: '',
      context: context,
      pageBuilder: (context, animation1, animation2) {
        return Container();
      });
}
