import 'dart:math';

import 'package:flutter/material.dart';
import 'package:randommix/provider/RecetaProvider.dart';

import 'EditarReceta.dart';

class HomePage extends StatefulWidget{
  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage>{
  var recetaProvider = RecetaProvider();

  @override
  void dispose(){
    super.dispose();
    recetaProvider.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(

    appBar: AppBar(
      title: Text('Selección aleatoria'),
    ),
    body: FutureBuilder(
        future: recetaProvider.InicializarBox(),
        builder: (context, snapShot){
          if(snapShot.connectionState == ConnectionState.done){
            return (recetaProvider.box.length < 1) ? Container() : BotonesSeleccion(context);
          }
          return Container();
        }
    ),
  );

  Center BotonesSeleccion(BuildContext context){

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[

          Row(
          children: <Widget>[
            Expanded(
            child: Container(
            height: 75,
            child: FlatButton(
            color: Colors.amber,
            onPressed: (){
              var recetasAlmuerzo = recetaProvider.LeerRecetas().values.where((Receta) => Receta.almuerzo == true);
              Random random = new Random();
              int? index = random.nextInt(recetasAlmuerzo.length);
              var recetaElegida = recetasAlmuerzo.elementAt(index);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => EditarReceta(recetaElegida, index, false)));
              },
            child: Text(
            "Almuerzo",
            ),
            ),
            )
            )
            ],
            ),
            Row(
            children: <Widget>[
            Expanded(
            child: Container(
            height: 75,
            child: FlatButton(
            color: Colors.blueGrey,
            onPressed: (){
              var recetasCena = recetaProvider.LeerRecetas().values.where((Receta) => Receta.cena == true);
              Random random = new Random();
              int? index = random.nextInt(recetasCena.length);
              var recetaElegida = recetasCena.elementAt(index);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => EditarReceta(recetaElegida, index, false)));
            },
            child: Text(
            "Cena",
            ),
            ),
            )
            )
            ],
          )
        ],
      ),
    );
  }
}