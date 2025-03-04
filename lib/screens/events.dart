import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:nn_helper/mainPage.dart';
import 'package:nn_helper/widgets/detailedInfo.dart';
import 'package:nn_helper/widgets/eventsDialog.dart';
import 'package:get/get.dart';
import '../main.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:google_fonts/google_fonts.dart';

List cinema = [];

class Events extends StatefulWidget {
  const Events({super.key});

  @override
  State<Events> createState() => _EventsState();
}

List images = [];
List<PaletteColor> colors = [];
List<PaletteColor> backgroundColors = [];
List<PaletteColor> buttonColors = [];

class _EventsState extends State<Events> {
  @override
  initState() {
    cinema = box.get('cinema') ?? [];
    images = box.get("images") ?? [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: cinema.length,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.only(top: 10, left: 3, right: 3),
              child: Card(
                color: backgroundColors[index].color.withAlpha(60),
                elevation: 0,
                child: Column(
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(
                              top: 10, bottom: 5, left: 10, right: 20),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.network(
                                  width: 140,
                                  height: 205,
                                  fit: BoxFit.cover,
                                  cinema[index]["img"])),
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(right: 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    margin: const EdgeInsets.only(top: 12),
                                    child: Text(
                                      cinema[index]["title"],
                                      style: GoogleFonts.notoSans(
                                          color: colors[index].color,
                                          fontSize: 24,
                                          fontWeight: FontWeight.w800),
                                    )),
                                Container(
                                    margin: const EdgeInsets.only(
                                        top: 5, bottom: 3, right: 5),
                                    child: Text(
                                      cinema[index]["details"],
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 5,
                                      style: const TextStyle(fontSize: 16),
                                    )),
                                Container(
                                  padding:
                                      const EdgeInsets.only(top: 0, bottom: 7),
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(8),
                                    onTap: () {
                                      Get.to(() => Detailedinfo(index: index,), transition: Transition.zoom);
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 3, horizontal: 5),
                                      child: Text(
                                        "Подробнее",
                                        style: TextStyle(
                                          color:
                                              colors[index].color.withAlpha(150),
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Card(
                            color: colors[index].color.withAlpha(120),
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            child: Container(
                                margin: const EdgeInsets.only(
                                    top: 3, bottom: 3, left: 10, right: 10),
                                child: LimitedText(
                                  text: cinema[index]["yearAndContries"] ?? "",
                                  maxLines: 20,
                                  style: const TextStyle(
                                      fontSize: 15, color: Colors.white),
                                  // style: TextStyle(
                                  //     fontSize: 15, color: Colors.white),
                                )),
                          ),
                          Card(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            color: colors[index].color.withAlpha(120),
                            child: Container(
                                margin: const EdgeInsets.only(
                                    top: 3, bottom: 3, left: 10, right: 10),
                                child: LimitedText(
                                  text: cinema[index]["tags"][0].toUpperCase() +
                                      cinema[index]["tags"].substring(1),
                                  maxLines: 20,
                                  style: const TextStyle(
                                      fontSize: 15, color: Colors.white),
                                )),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}

class LimitedText extends StatelessWidget {
  final String text;
  final int maxLines;
  final TextStyle style;

  LimitedText({
    required this.text,
    this.maxLines = 1,
    required TextStyle this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text.length > maxLines ? "${text.substring(0, maxLines)}..." : text,
      maxLines: maxLines,
      style: this.style,
    );
  }
}
