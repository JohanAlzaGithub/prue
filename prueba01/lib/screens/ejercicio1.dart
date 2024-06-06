import 'package:flutter/material.dart';

void main() {
  runApp(ejercicio1());
}

class ejercicio1 extends StatelessWidget {
  const ejercicio1({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //
      // appBar: AppBar(
      ///  title: const Text('Title'),),
      body: Body(context),
    );
  }
}

Widget Body(context) {
  return Container(width: MediaQuery.of(context).size.width,
    decoration: BoxDecoration(
      image: DecorationImage(image: NetworkImage("https://upload.wikimedia.org/wikipedia/en/thumb/4/4c/GokumangaToriyama.png/220px-GokumangaToriyama.png"),fit: BoxFit.cover )
    ),
    child: (Column(
      children: <Widget>[
        Text("Ejercicio 01"),
        Campo1(),
        Campo2(),
        boton1(context)
      ],
    )),
  );
}

final TextEditingController _velocidadI = TextEditingController();
final TextEditingController _velocidadF = TextEditingController();
Widget Campo1() {
  return (TextField(
    controller: _velocidadI,
    decoration: InputDecoration(hintText: "Ingresar la velocidad Inicial"),
  ));
}

Widget Campo2() {
  return (TextField(
    controller: _velocidadF,
    decoration: InputDecoration(hintText: "Ingresar la velocidad Final"),
  ));
}

Widget boton1(context) {
  return (ElevatedButton(
      onPressed: () {
        alerta(context);
      },
      child: Text("Cacular")));
}

double calcular() {
  double velocidadI = double.tryParse(_velocidadI.text) ?? 0.00;
  double velocidadF = double.tryParse(_velocidadF.text) ?? 0.00;
  double tiempo = (velocidadF - velocidadI) / 10;

  return tiempo;
}

void alerta(context) {
  if (calcular() > 10) {
    showDialog(
        context: context,
        builder: (context) {
          return (AlertDialog(
            title: Text("Respuesta"),
            content: Text("El tiempo obtenido es: ${calcular()}, No Aprobado "),
          ));
        });
  }else{
     showDialog(
        context: context,
        builder: (context) {
          return (AlertDialog(
            title: Text("Respuesta"),
            content: Text("El tiempo obtenido es: ${calcular()}, Aprobado "),
          ));
        });
  }
}
