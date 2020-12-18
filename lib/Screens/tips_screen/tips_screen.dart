import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class TipsScreen extends StatelessWidget {
  List<PageViewModel> getPages() {
    return [
      PageViewModel(
        image: Container(
            padding: EdgeInsets.only(
              top: 80.0,
            ),
            child: Image.asset('assets/images/ventana.png')),
        title: "Ventilación",
        bodyWidget: Container(
          padding: EdgeInsets.only(
            left: 15.0,
            right: 15.0,
          ),
          child: Text(
            "Siempre debes mantener una ventilación correcta en casa, y más aún en aquellas zonas en las que puedas tener problemas de humedad. El aire acondicionado puede ayudarte a mantener sin humedad las zonas de tu casa donde no llegue demasiado aire natural. ",
            textAlign: TextAlign.justify,
          ),
        ),
        footer: Text(""),
      ),
      PageViewModel(
        image: Container(
            padding: EdgeInsets.only(
              top: 80.0,
              left: 10.0,
              right: 10.0,
            ),
            child: Image.asset('assets/images/lluvia.png')),
        title: "Reconoce las fuentes de humedad",
        bodyWidget: Container(
          padding: EdgeInsets.only(
            left: 15.0,
            right: 15.0,
          ),
          child: Text(
            "Si encuentras una zona de tu casa en la que la humedad sea demasiado elevada, deberías buscar la causa de este problema. Por lo general, si hay caños rotos o fugas de agua en lugares que no están a la vista, esto se refleja en las paredes; poco a poco, comenzarán a mancharse.\nDebes tener en cuenta que si no solucionas estas filtraciones inmediatamente la condición podría agravarse hasta causar inundaciones.",
            textAlign: TextAlign.justify,
          ),
        ),
        footer: Text(""),
      ),
      PageViewModel(
        image: Container(
            padding: EdgeInsets.only(
              top: 100.0,
              left: 10.0,
              right: 10.0,
            ),
            child: Image.asset('assets/images/header.png')),
        title: "Utiliza un deshumidificador",
        bodyWidget: Container(
          padding: EdgeInsets.only(
            left: 15.0,
            right: 15.0,
          ),
          child: Text(
            "Este electrodoméstico es ideal para regiones lluviosas o frías. En ellas, la humedad suele acumularse con facilidad, ya que no existe la posibilidad de ventilar la casa permanentemente como en otras áreas. Por lo tanto, si deseas quitar la humedad en casa puedes recurrir a ellos para que absorban y drenen la humedad de forma sencilla.",
            textAlign: TextAlign.justify,
          ),
        ),
        footer: Text(""),
      ),
      PageViewModel(
        image: Container(
            padding: EdgeInsets.only(
              top: 80.0,
              left: 10.0,
              right: 10.0,
            ),
            child: Image.asset('assets/images/sal.png')),
        title: "Eliminar la humedad con sal",
        bodyWidget: Container(
          padding: EdgeInsets.only(
            left: 15.0,
            right: 15.0,
          ),
          child: Text(
            "Para hacerlo necesitarás un recipiente plano y un kilo de sal gruesa. Simplemente, coloca la sal en el recipiente y al cabo de uno o dos días habrá absorbido una gran parte de la humedad.\nLa sal es uno de los elementos con mayor capacidad de absorción. Además de ser muy útil para quitar la humedad en casa, también puede servir para eliminar manchas en la ropa. En el momento en el que notes que la sal está muy mojada o incluso si se ha puesto de color negra, será hora de renovarla.",
            textAlign: TextAlign.justify,
          ),
        ),
        footer: Text(""),
      ),
      PageViewModel(
        image: Container(
          padding: EdgeInsets.only(
            top: 40.0,
            left: 10.0,
            right: 10.0,
          ),
          child: Image.asset('assets/images/splash.png'),
        ),
        title: "Otros trucos para prevenir que haya humedad",
        bodyWidget: Container(
          padding: EdgeInsets.only(
            left: 15.0,
            right: 15.0,
          ),
          child: Text(
            "•Cuando cocines, enciende el extractor de aire.\n•La calefacción del ambiente nunca debería pasar los 20°C, dado que esto favorece la aparición de humedad en paredes y ambientes.\n•Cuando laves ropa, cuélgala fuera para que se seque. Si la dejas adentro, su humedad se transmitirá al resto de la habitación.\n•No acumules demasiadas plantas en un mismo ambiente. Esto favorecerá la producción y conservación del vaho, que es el vapor que despiden ciertos elementos.",
            textAlign: TextAlign.justify,
          ),
        ),
        footer: Text(""),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: IntroductionScreen(
        done: Text(
          '',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        onDone: () {},
        pages: getPages(),
      ),
    );
  }
}
