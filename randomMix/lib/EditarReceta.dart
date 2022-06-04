import 'package:flutter/material.dart';
import 'package:randommix/Datos/Receta.dart';

class EditarReceta extends StatefulWidget {

  @override
  _EditarReceta createState() => _EditarReceta();

}

class _EditarReceta extends State<EditarReceta>{
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
    almuerzoController = receta.almuerzo;
    //almuerzoController = true;
    cenaController = receta.cena;
    lacteosController = receta.lacteos;
    veganoController = receta.vegano;
    favoritoController = receta.favorito;

    return Scaffold(
      appBar: AppBar(
        title: Text("Datos receta")
      ),
      body: Container(
       child: Padding(
         child: Form(
           key: _formKey,
           child: ListView(
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
               SizedBox(
                 height: 20,
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
               SizedBox(
                 height: 20,
               ),
               Text('Filtros de la receta', style: TextStyle(fontWeight: FontWeight.bold)),
               SizedBox(
                 height: 10,
               ),
               CheckboxListTile(
                 controlAffinity: ListTileControlAffinity.leading,
                 title: Text('Receta para almorzar'),
                 value: almuerzoController,
                 onChanged: (value) {
                   setState(() => almuerzoController = value!);
                 },
               ),
               CheckboxListTile(
                 controlAffinity: ListTileControlAffinity.leading,
                 title: Text('Receta para cenar'),
                 value: cenaController,
                 onChanged: (value) {
                   setState(() => cenaController = value!);
                 },
               ),
               CheckboxListTile(
                 controlAffinity: ListTileControlAffinity.leading,
                 title: Text('Receta para intolerantes'),
                 value: lacteosController,
                 onChanged: (value) {
                   setState(() => lacteosController = value!);
                 },
               ),
               CheckboxListTile(
                 controlAffinity: ListTileControlAffinity.leading,
                 title: Text('Receta apta para veganos'),
                 value: veganoController,
                 onChanged: (value) {
                   setState(() => veganoController = value!);
                 },
               ),
               ElevatedButton(
                 onPressed: (){
                 },
                 child: Text("Guardar")
               )
             ]
           )
         ),
         padding: EdgeInsets.all(15),
       )
      )
    );
  }
}