import 'package:flutter/material.dart';

void main(){
  runApp(ejercicio2());
}

class ejercicio2 extends StatelessWidget {
  const ejercicio2({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Home(),
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
        body:Body(context),
    );
  }
}


Widget Body(context){
  return Container(width: MediaQuery.of(context).size.width,
    decoration: BoxDecoration(
      image: DecorationImage(image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTFwnpDhmJxczU16j1WdlJgzkW_m726Vc9YeQ&s"),fit: BoxFit.cover )
    ),
    child: ( 
      Column(
      children:<Widget>[
        Text("Ejercicio 02"),
        Campo1(),
        boton1(context)
      ],
      )
    ),
  );
}

final TextEditingController _altura = TextEditingController();

Widget Campo1(){
  return(     
    TextField(
      controller: _altura,
      decoration: InputDecoration(
      hintText: "Ingresar la Altura"
    ),)
    
  );
}




Widget boton1(context){
  return(
    ElevatedButton(onPressed: (){
      alerta(context);
    },child: Text("Cacular"))
  );
}

double calcular(){
double altura = double.tryParse(_altura.text)?? 0.00;
double presion = 1025*9.8*altura;

return presion;

}

void alerta(context){
showDialog(context: context, builder: 
(context){
  return(
  AlertDialog(
title: Text("Respuesta"),
content: Text("La presion es ${calcular()}"),

  )
  );
}
);

}