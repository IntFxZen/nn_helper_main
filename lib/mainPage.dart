import 'package:flutter/material.dart';
import 'package:nn_helper/screens/events.dart';
import 'package:nn_helper/screens/news.dart';
import 'package:nn_helper/widgets/detailedInfo.dart';
import 'colorTheme.dart';
import 'main.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:blur/blur.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

List lst = <Widget>[
  Events(),
  News(),
  Center(child: Text("Транспорт"),),
  Center(child: Text("Профиль"),),
];

// void getData()async{
//   var response = await http.get(Uri.parse('http://localhost:5000/event/kinoPrint'), headers: {"Cookie": access});
//
// }

List names = ['Мероприятия', 'Новости', 'Транспорт', 'Профиль'];
class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Colors.white,
          extendBodyBehindAppBar: true,
          extendBody: true,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(65),
            child: AppBar(
              automaticallyImplyLeading: false,
              surfaceTintColor: Colors.transparent,
              title: Text(names[selectedIndex], style: GoogleFonts.notoSans(fontSize: 30, color: Colors.blueGrey, fontWeight: FontWeight.bold),),
              backgroundColor: const Color.fromRGBO(255, 255, 255, 0.20),
            ).frosted(blur: 15),
          ),
          body: lst[selectedIndex],
          bottomNavigationBar: NavigationBarTheme(
            data: NavigationBarThemeData(
              backgroundColor: Color.fromRGBO(255, 255, 255, 0.20),
              labelTextStyle: MaterialStateProperty.resolveWith<TextStyle>(
                    (Set<MaterialState> states) => states.contains(MaterialState.selected)
                    ? TextStyle(color: navigationIconsColor, fontSize: 13)
                    : const TextStyle(color: Colors.black, fontSize: 13),
              ),
            ),
            child: NavigationBar(
              // backgroundColor: Color(0x00ffffff),
                selectedIndex: selectedIndex,
                onDestinationSelected: (int index) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                indicatorColor: navigationIndicatorColor,
                destinations: [
                  NavigationDestination(
                    icon: const Icon(FluentIcons.calendar_clock_20_regular),
                    selectedIcon: Icon(FluentIcons.calendar_clock_20_filled, color: navigationIconsColor,),
                    label: 'Мероприятия',
                  ),
                  NavigationDestination(
                    icon: const Icon(FluentIcons.news_28_regular),
                    selectedIcon: Icon(FluentIcons.news_28_filled, color: navigationIconsColor),
                    label: 'Новости',
                  ),
                  NavigationDestination(
                    icon: const Icon(FluentIcons.vehicle_bus_24_regular),
                    selectedIcon: Icon(FluentIcons.vehicle_bus_24_filled, color: navigationIconsColor),
                    label: 'Транспорт',
                  ),
                  NavigationDestination(
                    icon: const Icon(FluentIcons.person_32_regular),
                    selectedIcon: Icon(FluentIcons.person_32_filled, color: navigationIconsColor,),
                    label: 'Профиль',
                  ),
                ]
            ).frosted(blur: 12),
          )
        ),
      ],
    );
  }
}
