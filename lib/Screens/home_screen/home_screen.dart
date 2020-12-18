import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:home_in_the_hand/Screens/main_screen/main_screen.dart';
import 'package:home_in_the_hand/Screens/tips_screen/tips_screen.dart';
import 'package:home_in_the_hand/constant.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  List listOfPages = [
    Container(
      child: MainScreen(),
    ),
    Container(
      color: Colors.greenAccent
    ),
    Container(
      child: TipsScreen(),
    ),
    Container(
      color: Colors.blue[300],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: currentIndex,
        onItemSelected: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
            activeColor: kPrimaryColor,
            inactiveColor: Colors.black,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.person),
            title: Text('Cuenta'),
            activeColor: kPrimaryColor,
            inactiveColor: Colors.black,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.book),
            title: Text('Tips'),
            activeColor: kPrimaryColor,
            inactiveColor: Colors.black,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.phone_android),
            title: Text('Simulación'),
            activeColor: kPrimaryColor,
            inactiveColor: Colors.black,
          )
        ],
      ),
      body: listOfPages[currentIndex],
    );
  }
}

/*
SingleChildScrollView(
        controller: controller,
        child: Column(
          children: <Widget>[
            MyHeader(
              image: "assets/icons/banner.svg",
              textTop: "All you need",
              textBottom: "is stay at home.",
              offset: offset,
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 40.0),
                height: MediaQuery.of(context).size.height - 200,
                width: double.infinity,
                child: Text(
                  "¡Hola, $nombre!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: kPrimaryColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
*/
