import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import '../login/login.dart';
import 'package:http/http.dart' as http;
import '../main.dart';
import 'package:palette_generator/palette_generator.dart';

import '../screens/events.dart';
import '../screens/news.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  List<String> img = [];
  var access = box.get('access');
  void getData()async{
    var response = await http.post(Uri.parse('$server/events/eventPrint'), body: {"bdName" : "kino"}, headers: {'Cookie' : "access=$access"});
    print('-------------------------');
    print(response.body);
    print(response.statusCode);
    var lst = jsonDecode(response.body);

    for (int i = 0; i < lst.length; i++){
      img.add(lst[i]['img']);
    }


    box.put('images', img);
    box.put("cinema", lst);
    for (String image in img){
      final PaletteGenerator generator = await PaletteGenerator.fromImageProvider(
        NetworkImage(image),
        size: const Size(300, 300),
      );
      // print(generator.colors);
      buttonColors.add(generator.mutedColor?? PaletteColor(Colors.black, 2));
      backgroundColors.add(generator.lightMutedColor ?? PaletteColor(const Color.fromRGBO(
          217, 217, 217, 1.0), 2));
      colors.add(generator.darkMutedColor ?? PaletteColor(Colors.black, 2));
    }
  }
  update() async{
    var response = await http.post(Uri.parse('$server/events/eventPrint'), body: {"bdName" : "news"}, headers: {'Cookie' : "access=$access"});
    news = jsonDecode(response.body);
    // print(news);
    // box.put('news', news);
  }

  @override
  Widget build(BuildContext context) {

    return FlutterSplashScreen.fadeIn(
        setStateTimer: const Duration(milliseconds: 500), // 500
        animationDuration: const Duration(seconds: 1), // 2
        duration: const Duration(milliseconds: 3000), // 40000
        animationCurve: Curves.easeIn,
        backgroundColor: Colors.white,
        onInit: (){
          getData();
          update();
        },
        childWidget: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              height: 350,
              width: 350,
              child: Image.asset("assets/images/nizhegorodskoj.png"),
            ),
            Text("Ассистент нижегородца", style: GoogleFonts.montserrat(
              fontSize: 26,
              color: const Color.fromARGB(255, 60, 60, 60),
              fontWeight: FontWeight.w500
            ),),
            Text("Всегда с вами,\nВсегда под рукой", style: GoogleFonts.montserrat(
              fontSize: 20,
              color: const Color.fromARGB(255, 60, 60, 60),
            ), textAlign: TextAlign.center,)
          ],
        ),

        nextScreen: const Login()
    );
  }
}
