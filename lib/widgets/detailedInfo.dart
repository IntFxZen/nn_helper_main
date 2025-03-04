import 'package:flutter/material.dart';
import 'package:blur/blur.dart';
import 'package:google_fonts/google_fonts.dart';
import '../screens/events.dart';

class Detailedinfo extends StatelessWidget {
  Detailedinfo({super.key, required this.index});
  var index;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar:
      PreferredSize(
        preferredSize: const Size.fromHeight(65),
        child: AppBar(
          automaticallyImplyLeading: true,
          surfaceTintColor: Colors.transparent,
          title: Text("Описание", style: GoogleFonts.notoSans(fontSize: 30, color: colors[index].color, fontWeight: FontWeight.bold),),
          backgroundColor: const Color.fromRGBO(255, 255, 255, 0.20),
        ).frosted(blur: 15),
      ),
    
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 105, left: 10, right: 10, bottom: 20),
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
                  style: GoogleFonts.notoSans(
                      color: colors[index].color,
                      fontSize: 28,
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
                    style: GoogleFonts.notoSans(
                        color: colors[index].color,
                        fontSize: 19,
                        fontWeight: FontWeight.bold),
                  ),
                )
              },
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Text(
                    cinema[index]["details"],
                    textAlign: TextAlign.justify,
                    style: GoogleFonts.notoSans(fontSize: 19),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10, left: 15, right: 15),
                child: Text(
                  "Жанр: ${cinema[index]["tags"]}",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.notoSans(color: colors[index].color, fontSize: 18, fontWeight: FontWeight.bold,),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  "Год и страна: ${cinema[index]["yearAndContries"]}",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.notoSans(color: colors[index].color, fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
