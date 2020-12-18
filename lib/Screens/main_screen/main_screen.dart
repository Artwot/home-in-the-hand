import 'package:flutter/material.dart';
import 'package:home_in_the_hand/constant.dart';
import 'package:home_in_the_hand/widgets/myheader.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final controller = ScrollController();
  double offset = 0;
  String nombre = "Jorge Arturo";

  @override
  void initState() {
    super.initState();
    controller.addListener(onScroll);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void onScroll() {
    setState(() {
      offset = (controller.hasClients) ? controller.offset : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
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
                child: Column(
                  children: [
                    Text(
                      "¡Hola, $nombre!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: kPrimaryColor,
                      ),
                    ),
                    Container(
                      child: Row(
                        children: [
                          Image.asset("assets/images/logo.jpeg", ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
