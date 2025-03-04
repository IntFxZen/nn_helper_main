import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:blur/blur.dart';
import 'package:nn_helper/screens/events.dart';
import '../main.dart';

class News extends StatefulWidget {
  const News({super.key});

  @override
  State<News> createState() => _NewsState();
}
List news = [];
class _NewsState extends State<News> {

  update() async{
    var access = box.get("access");
    var response = await http.get(Uri.parse('http://localhost:5000/event/newsPrint'), headers: {'Cookie' : "access=$access"});
    news = jsonDecode(response.body);
  }

  @override
  void initState() {
    // update();
    // news = box.get('news');
    // print(news);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: news.length,
          itemBuilder: (context, index){
            var data = news[index]["dataNews"].toString().split(" ");
        return Container(
          margin: const EdgeInsets.only(top: 10, left: 3, right: 3),
          child: Column(
            children: [
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(news[index]["title"], style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold), textAlign: TextAlign.start,)
              ),
              Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                        top: 10, bottom: 5, left: 10, right: 25),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.network(
                            // width: 320,
                            // height: 211,
                            fit: BoxFit.cover,
                            news[index]["img"]),
                  ),),
                  Positioned(
                      bottom: 20,
                      right: 40,
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 7),
                          decoration: const BoxDecoration(
                            color: Color.fromRGBO(255, 255, 255, 0.4),

                          ),
                          child: LimitedText(text: news[index]["tag"], maxLines: 20, style: const TextStyle(color: Colors.black, fontWeight: FontWeight.normal),)).frosted(blur: 8, borderRadius: BorderRadius.circular(8))),
                ],
              ),

              Container(
                  alignment: Alignment.centerRight,
                  margin: const EdgeInsets.symmetric(horizontal: 40),
                  child: Text("${data[0][0].toUpperCase()}${data[0].substring(1)}, ${data[1]}", style: const TextStyle(fontWeight: FontWeight.bold, color: Color.fromRGBO(
                      90, 90, 90, 1.0)),)),
              Container(
                margin: const EdgeInsets.only(top: 20, left: 25, right: 25, bottom: 10),
                clipBehavior: Clip.hardEdge,
                width: double.infinity,
                height: 2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(500),
                  color: const Color.fromRGBO(202, 196, 208, 1)
                ),

              )
            ],
          ),
        );
      }),
    );
  }
}
