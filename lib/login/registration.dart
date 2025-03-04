import 'package:flutter/material.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
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

  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();


  void reg() async{
    var response = await http.post(Uri.parse('http://87.242.107.112/users/register'), body: {'name': _name.text, 'email': _email.text, 'password' : _password.text});
    print(response.body);
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
                    "Регистрация",
                    textAlign: TextAlign.center,
                    // style: TextStyle(fontSize: 30, color: Colors.black, ),
                    style: GoogleFonts.montserrat(
                        fontSize: 32,
                        color: const Color.fromARGB(255, 60, 60, 60),
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 30,
                  ),

                  Container(
                    height: 50,
                    constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width * 0.92),
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
                      controller: _name,
                      cursorColor: const Color.fromARGB(255, 79, 79, 79),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color.fromARGB(255, 223, 226, 230),
                        isDense: true,
                        hintText: 'Имя',
                        prefixIcon: Container(
                          width: 35,
                          margin: const EdgeInsets.only(
                              left: 6, top: 4, bottom: 4, right: 10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(11)),
                          child: const Icon(
                            // Icons.email_outlined,
                            FluentIcons.person_24_regular,
                            color: Colors.blueAccent,
                            size: 22,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide:
                            const BorderSide(width: 0, color: Colors.white)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide:
                            const BorderSide(width: .7, color: Colors.grey)),
                        hintStyle: const TextStyle(
                            color: Color.fromARGB(255, 152, 156, 161),
                            fontWeight: FontWeight.w400),
                      ),
                      style: const TextStyle(
                          color: Color.fromARGB(255, 79, 79, 79), fontSize: 17.4),
                    ),
                  ),

                  const SizedBox(
                    height: 12,
                  ),
                  Container(
                    height: 50,
                    constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width * 0.92),
                    margin: const EdgeInsets.symmetric(horizontal: 20,),
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
                            borderSide:
                            const BorderSide(width: 0, color: Colors.white)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide:
                            const BorderSide(width: .7, color: Colors.grey)),
                        hintStyle: const TextStyle(
                            color: Color.fromARGB(255, 152, 156, 161),
                            fontWeight: FontWeight.w400),
                      ),
                      style: const TextStyle(
                          color: Color.fromARGB(255, 79, 79, 79), fontSize: 17.4),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Container(
                    height: 50,
                    constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width * 0.92),
                    margin:
                    const EdgeInsets.symmetric(horizontal: 20,),
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
                            borderSide:
                            const BorderSide(width: 0, color: Colors.white)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide:
                            const BorderSide(width: .7, color: Colors.grey)),
                        hintStyle: const TextStyle(
                            color: Color.fromARGB(255, 152, 156, 161),
                            fontWeight: FontWeight.w400),
                      ),
                      style: const TextStyle(
                          color: Color.fromARGB(255, 79, 79, 79), fontSize: 17.4),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  SizedBox(
                    child: Container(
                      constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * 0.92),
                      width: MediaQuery.of(context).size.width,
                      margin:
                      const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                      height: 50,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              elevation: 0,
                              backgroundColor:
                              const Color.fromRGBO(21, 122, 254, 1),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15))),
                          onPressed: () {
                            reg();
                          },
                          child: const Text(
                            'Зарегестрироваться',
                            style: TextStyle(fontSize: 17, color: Colors.white, fontWeight: FontWeight.w500),
                          )),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Уже есть аккаунт?",
                        style: TextStyle(color: Colors.black),
                      ),
                      TextButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: const Text(
                            "Войти",
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
