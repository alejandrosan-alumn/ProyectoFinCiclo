import 'package:flutter/material.dart';
import 'EditarReceta.dart';
import 'ListadoRecetas.dart';

class RecetarioPage extends StatelessWidget{

  @override
  Widget build(BuildContext context){

    return MaterialApp(
      initialRoute: "/",
      routes: {
       "/":(context) => ListadoRecetas(),
        "/editar":(context) => EditarReceta()
      }
    );
  }
}