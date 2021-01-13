import 'package:flutter/material.dart';
import 'package:device_apps/device_apps.dart';

class SimulationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(40.0),
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Una nueva manera de ver las cosas",
            style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20.0,
          ),
          Text(
            "Da click en el botón para abrir la aplicación informativa en realidad aumentada. Sólo ubica el objeto donde se desplagará el video y listo.",
            textAlign: TextAlign.justify,
            style: TextStyle(
              fontSize: 15.0,
              color: Colors.grey[700],
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Container(
            height: MediaQuery.of(context).size.height / 3,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/ra.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: 50.0,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.0),
            child: Container(
              padding: EdgeInsets.only(
                top: 3.0,
                left: 3.0,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50.0),
                border: Border(
                  bottom: BorderSide(color: Colors.black),
                  top: BorderSide(color: Colors.black),
                  left: BorderSide(color: Colors.black),
                  right: BorderSide(color: Colors.black),
                ),
              ),
              child: MaterialButton(
                minWidth: double.infinity,
                height: 60,
                onPressed: () {
                  print("Presionaste el botón");
                  DeviceApps.openApp('com.DefaultCompany.home_in_the_hand');
                },
                color: Colors.greenAccent,
                elevation: 0.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
                child: Text(
                  "Abrir aplicación",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18.0,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
