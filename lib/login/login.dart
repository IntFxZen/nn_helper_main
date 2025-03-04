import 'dart:convert';
import 'package:nn_helper/main.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:nn_helper/login/registration.dart';
import 'package:http/http.dart' as http;
import 'package:palette_generator/palette_generator.dart';
import '../mainPage.dart';
import '../screens/events.dart';


class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool visible = true;
  Color color = const Color.fromARGB(255, 79, 79, 79);

  setobscure() {
    setState(() {
      visible = !visible;
      if (visible == false) {
        color = const Color.fromRGBO(21, 122, 254, 1);
      } else {
        color = const Color.fromARGB(255, 79, 79, 79);
      }
    });
  }

  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  void login()async{
    var response = await http.post(Uri.parse('$server/users/login'), body: {'email': _email.text, 'password' : _password.text});
    if (response.statusCode == 200){
      Get.to(() => const MainPage());
    }

    var access = response.headers.values.toList()[1].split(";")[0].substring(7);

    box.put("access", access);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Center(
          child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    "Добро пожаловать!",
                    textAlign: TextAlign.center,
                    // style: TextStyle(fontSize: 30, color: Colors.black, ),
                    style: GoogleFonts.montserrat(
                        fontSize: 32,
                        color: const Color.fromARGB(255, 60, 60, 60),
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 50,
                    constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width * 0.85),
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
                      controller: _email,
                      cursorColor: const Color.fromARGB(255, 79, 79, 79),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color.fromARGB(255, 223, 226, 230),
                        isDense: true,
                        hintText: 'Электронная почта',
                        prefixIcon: Container(
                          width: 35,
                          margin: const EdgeInsets.only(
                              left: 6, top: 4, bottom: 4, right: 10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(11)),
                          child: const Icon(
                            // Icons.email_outlined,
                            FluentIcons.mail_24_regular,
                            color: Colors.blueAccent,
                            size: 22,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                                width: 0, color: Colors.white)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                                width: .7, color: Colors.grey)),
                        hintStyle: const TextStyle(
                            color: Color.fromARGB(255, 152, 156, 161),
                            fontWeight: FontWeight.w400),
                      ),
                      style: const TextStyle(
                          color: Color.fromARGB(255, 79, 79, 79),
                          fontSize: 17.4),
                    ),
                  ),
                  Container(
                    height: 50,
                    constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width * 0.85),
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 15),
                    child: TextFormField(
                      controller: _password,
                      cursorColor: const Color.fromARGB(255, 79, 79, 79),
                      obscureText: visible,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color.fromARGB(255, 223, 226, 230),
                        isDense: true,
                        hintText: 'Пароль',
                        suffixIcon: InkWell(
                            splashColor: Colors.transparent,
                            borderRadius: BorderRadius.circular(20),
                            child: Icon(
                              Icons.visibility_outlined,
                              color: color,
                            ),
                            onTap: () => setobscure()),
                        prefixIcon: Container(
                          width: 35,
                          margin: const EdgeInsets.only(
                              left: 6, top: 4, bottom: 4, right: 10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(11)),
                          child: const Icon(
                            // Icons.https_outlined,
                            FluentIcons.lock_closed_24_regular,
                            color: Colors.blueAccent,
                            size: 22,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                                width: 0, color: Colors.white)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                                width: .7, color: Colors.grey)),
                        hintStyle: const TextStyle(
                            color: Color.fromARGB(255, 152, 156, 161),
                            fontWeight: FontWeight.w400),
                      ),
                      style: const TextStyle(
                          color: Color.fromARGB(255, 79, 79, 79),
                          fontSize: 17.4),
                    ),
                  ),
                  SizedBox(
                    child: Container(
                      constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * 0.85),
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.only(
                          left: 20, right: 20, bottom: 10),
                      height: 50,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              elevation: 0,
                              backgroundColor:
                                  const Color.fromRGBO(21, 122, 254, 1),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15))),
                          onPressed: () {
                            login();
                          },
                          child: const Text(
                            'Войти',
                            style: TextStyle(
                                fontSize: 17,
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          )),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Нет аккаунта?",
                        style: TextStyle(color: Colors.black),
                      ),
                      TextButton(
                          onPressed: () {
                            Get.to(() => const Registration(),
                                transition: Transition.rightToLeft);
                          },
                          child: const Text(
                            "Зарегестрироваться",
                            style: TextStyle(
                                color: Color.fromRGBO(21, 122, 254, 1),
                                fontWeight: FontWeight.w400),
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
