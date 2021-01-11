import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:home_in_the_hand/Screens/home_screen/home_screen.dart';
import 'package:home_in_the_hand/Screens/welcome_screen/login_screen.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class SignUpScreen extends StatelessWidget {
  String _email = '';
  String _password = '';

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
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
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40.0),
          height: MediaQuery.of(context).size.height - 50,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text(
                    "Crear cuenta",
                    style:
                        TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    "Ingrese los datos para crear su cuenta.",
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  makeInput(
                      label: "Nombre(s)", keyboardType: TextInputType.name),
                  makeInput(
                      label: "Apellidos", keyboardType: TextInputType.name),
                  makeInput(
                      label: "Email", keyboardType: TextInputType.emailAddress),
                  makeInput(label: "Password", obscureText: true),
                ],
              ),
              Column(
                children: [
                  Container(
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
                      onPressed: () async {
                        print("Este es el valor del EMAIL: " + _email);
                        print(
                            "Este es el valor de la CONTRASEÑA: " + _password);
                        try {
                          UserCredential userCredential = await FirebaseAuth
                              .instance
                              .createUserWithEmailAndPassword(
                                  email: _email, password: _password);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeScreen(),
                            ),
                          );
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'weak-password') {
                            print('The password provided is too weak.');
                            handleLoginOutPopup(context,
                                "La contraseña debe tener al menos 6 caracteres.");
                          } else if (e.code == 'email-already-in-use') {
                            print(
                                'Ya existe una cuenta registrada con este email.');
                            handleLoginOutPopup(context,
                                "Ya existe una cuenta registrada con este email.");
                          }
                        } catch (e) {
                          print("UPS!");
                        }
                      },
                      color: Colors.greenAccent,
                      elevation: 0.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      child: Text(
                        "Registrarse",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "¿Ya tiene una cuenta? ",
                        style: TextStyle(fontSize: 13.0),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ),
                          );
                        },
                        child: Text(
                          "Inicie sesión",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 13.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
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
          onChanged: (value) {
            if (label == "Email") {
              _email = value;
            } else {
              _password = value;
            }
          },
        ),
        SizedBox(
          height: 30.0,
        ),
      ],
    );
  }

  handleLoginOutPopup(context, desc) {
    Alert(
      context: context,
      type: AlertType.info,
      title: "¡Atención!",
      desc: desc,
      buttons: [
        DialogButton(
          child: Text(
            "Ok",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          color: Colors.teal,
        ),
      ],
    ).show();
  }
}
