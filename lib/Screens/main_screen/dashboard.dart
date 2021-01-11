import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:home_in_the_hand/widgets/circle_progress.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard>
    with SingleTickerProviderStateMixin {
  bool isLoading = false;
  final databaseReference = FirebaseDatabase.instance.reference();
  AnimationController progressController;
  Animation<double> tempAnimation;
  Animation<double> humidityAnimation;

  @override
  void initState() {
    super.initState();
    print("Aquí se ve qué show");
    databaseReference.once().then((DataSnapshot snapshot) {
      int temp = snapshot.value['Temperatura'];
      int humidity = snapshot.value['Humedad'];
      isLoading = true;
      _DashboardInit(temp.toDouble(), humidity.toDouble());
    });
  }

  _DashboardInit(double temp, double humid) {
    progressController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 5000)); //5s

    tempAnimation =
        Tween<double>(begin: -10, end: temp).animate(progressController)
          ..addListener(() {
            setState(() {});
          });

    humidityAnimation =
        Tween<double>(begin: 0, end: humid).animate(progressController)
          ..addListener(() {
            setState(() {});
          });

    progressController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Su habitación ahora: '),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Center(
          child: isLoading
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    CustomPaint(
                      foregroundPainter:
                          CircleProgress(tempAnimation.value, true),
                      child: Container(
                        width: 200,
                        height: 200,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text('Temperatura'),
                              Text(
                                '${tempAnimation.value.toInt()}',
                                style: TextStyle(
                                    fontSize: 50, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '°C',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    CustomPaint(
                      foregroundPainter:
                          CircleProgress(humidityAnimation.value, false),
                      child: Container(
                        width: 200,
                        height: 200,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text('Humedad'),
                              Text(
                                '${humidityAnimation.value.toInt()}',
                                style: TextStyle(
                                    fontSize: 50, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '%',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                )
              : Text(
                  'Cargando...',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                )),
    );
  }
/*
  handleLoginOutPopup() {
    Alert(
      context: context,
      type: AlertType.info,
      title: "Login Out",
      desc: "Do you want to login out now?",
      buttons: [
        DialogButton(
          child: Text(
            "No",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          color: Colors.teal,
        ),
        DialogButton(
          child: Text(
            "Yes",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: handleSignOut,
          color: Colors.teal,
        )
      ],
    ).show();
  }*/

  Future<Null> handleSignOut() async {
    this.setState(() {
      isLoading = true;
    });

    this.setState(() {
      isLoading = false;
    });
  }
}
