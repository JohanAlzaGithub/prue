import 'package:flutter/material.dart';
import 'package:prueba01/screens/ejercicio1.dart';
import 'package:prueba01/screens/ejercicio2.dart';

void main() {
  runApp(Prueba());
}

class Prueba extends StatelessWidget {
  const Prueba({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: Home());
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //indice
  int indice = 0;
  @override
  Widget build(BuildContext context) {
    //lista
    List<Widget> screens = [Cuerpo(context), ejercicio1(),ejercicio2()];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Prueba'),
      ),
      body: screens[indice],

      //navbar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: indice,
        onTap: (valor) {
          setState(() {
            indice = valor;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.car_crash_outlined), label: "Ejercicio 1"),
          BottomNavigationBarItem(
              icon: Icon(Icons.directions_boat), label: "Ejercicio 2")
        ],
      ),
    );
  }
}

Widget Cuerpo(context) {
  return Container(  
    width: MediaQuery.of(context).size.width,
    decoration: BoxDecoration(
      image: DecorationImage(image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ-wIdVkZvYXfRdMoV7MpCA_6mBumS9jliWeQ&s"),fit: BoxFit.cover )
    ),
    child: (Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text("Nombre: Johan Alza", style: TextStyle(fontSize: 25 , color: Color.fromARGB(122, 255, 2, 2)) ),
        Text("Usuario: JohanAlzaGit",style: TextStyle(fontSize: 25, color: Color.fromARGB(122, 255, 2, 2))),
        boton(context)
      ],
    )),
  );
}

Widget boton(context) {
  return (FilledButton(
      onPressed: () {
        alerta(context);
      },
      child: Text("Presiona Aqui")));
}

void alerta(context) {
  showDialog(
      context: context,
      builder: (context) {
        return (AlertDialog(
          title: Text("Alerta"),
          content: Text("Desea ir al Ejercicio2?"),
          actions: [
            TextButton(
                onPressed: () {
                  //direcionamiento
                  ir(context);
                },
                child: Text("Si")),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Cancelar"))
          ],
        ));
      });
}

void ir(context){
Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const ejercicio2()));
}


