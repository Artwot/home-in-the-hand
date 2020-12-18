import 'package:flutter/material.dart';
import 'package:home_in_the_hand/Screens/home_screen/home_screen.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20.0,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text(
                        "Iniciar Sesión",
                        style: TextStyle(
                            fontSize: 30.0, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        "Accede con los datos de tu cuenta.",
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40.0),
                    child: Column(
                      children: [
                        makeInput(
                            label: "Email",
                            keyboardType: TextInputType.emailAddress),
                        makeInput(label: "Password", obscureText: true),
                      ],
                    ),
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeScreen(),
                            ),
                          );
                        },
                        color: Colors.greenAccent,
                        elevation: 0.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        child: Text(
                          "Iniciar Sesión",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "¿Aún no tienes una cuenta? ",
                        style: TextStyle(fontSize: 10.0),
                      ),
                      Text(
                        "Regístrese",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 10.0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 3,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/home.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget makeInput({label, obscureText = false, keyboardType}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 15.0,
            fontWeight: FontWeight.w400,
            color: Colors.black87,
          ),
        ),
        SizedBox(
          height: 5.0,
        ),
        TextField(
          obscureText: obscureText,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            contentPadding:
                EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey[400],
              ),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey[400],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 30.0,
        ),
      ],
    );
  }
}
