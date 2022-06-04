import 'dart:html';

import 'package:flutter/material.dart';
import 'package:randommix/Datos/Receta.dart';

class EditarReceta extends StatelessWidget{

  final _formKey = GlobalKey<FormState>();
  final nombreRecetaController = TextEditingController();
  final detallesRecetaController = TextEditingController();
  final ingredientesRecetaController = TextEditingController();
  bool almuerzoController = false;
  bool cenaController = false;
  bool lacteosController = false;
  bool veganoController = false;
  bool favoritoController = false;

  @override
  Widget build(BuildContext context) {

    Receta receta = ModalRoute.of(context)!.settings.arguments as Receta;
    nombreRecetaController.text = receta.nombreReceta;
    detallesRecetaController.text = receta.detalles;
    ingredientesRecetaController.text = receta.ingredientes;

    return Scaffold(
      appBar: AppBar(
        title: Text("Datos receta")
      ),
      body: Container(
       child: Padding(
         child: Form(
           key: _formKey,
           child: Column(
             children: <Widget>[
               TextFormField(
                 controller: nombreRecetaController,
                 validator: (value){
                   if(value == null)
                     return "El nombre de la receta debe ser obligatorio";
                   return null;
                 },
                 decoration: InputDecoration(
                   labelText: "Nombre de la receta"
                 ),
               ),
               SizedBox(
                 height: 20,
               ),
               TextFormField(
                 controller: detallesRecetaController,
                 validator: (value){
                   return null;
                 },
                 decoration: InputDecoration(
                     labelText: "detalles de la receta"
                 ),
               ),
               TextFormField(
                 controller: ingredientesRecetaController,
                 validator: (value){
                   return null;
                 },
                 decoration: InputDecoration(
                     labelText: "ingredientes de la receta"
                 ),
               ),
             ],
           ),
         ),
         padding: EdgeInsets.all(15),
       )
      )
    );
  }
}