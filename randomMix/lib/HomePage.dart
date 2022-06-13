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
  bool lactosa = false;
  bool vegano = false;
  bool favorito = false;

  @override
  void dispose(){
    super.dispose();
    recetaProvider.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(

    appBar: AppBar(
      title: Text('Selección aleatoria'),
      leading: Builder(
        builder: (context){
          return IconButton(
              icon: Icon(Icons.filter_alt),
            onPressed: () => Scaffold.of(context).openDrawer(),
          );
        }
      ),
    ),
    drawer: MenuFiltro(context),
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

  Drawer MenuFiltro(BuildContext context){

    return new Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.red,
              ),
            child: Text('Filtros para la búsqueda'),
          ),
          CheckboxListTile(
            title: Text("Filtro para alérgicos a la lactosa"),
            value: lactosa,
            onChanged: (lactosaSi){
              setState(() {
                lactosa = lactosaSi!;
              });
            },
            controlAffinity: ListTileControlAffinity.leading,
          ),
          CheckboxListTile(
            title: Text("Filtro para gente vegana"),
            value: vegano,
            onChanged: (veganoSi){
              setState(() {
                vegano = veganoSi!;
              });
            },
            controlAffinity: ListTileControlAffinity.leading,
          ),
          CheckboxListTile(
            title: Text("Filtro para mis recetas favoritas"),
            value: favorito,
            onChanged: (favoritoSi){
              setState(() {
                favorito = favoritoSi!;
              });
            },
            controlAffinity: ListTileControlAffinity.leading,
          ),
        ],
      ),
    );
  }

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
              var recetasAlmuerzo = ElegirDatosAlmuerzo();
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

  Iterable<dynamic> ElegirDatosAlmuerzo(){

    var datosElegidos;
    if(lactosa)
      datosElegidos = recetaProvider.LeerRecetas().values.where((Receta) => Receta.almuerzo == true && Receta.lacteos == true);
    else if(vegano)
      datosElegidos = recetaProvider.LeerRecetas().values.where((Receta) => Receta.almuerzo == true && Receta.vegano == true);
    else if(favorito)
      datosElegidos = recetaProvider.LeerRecetas().values.where((Receta) => Receta.almuerzo == true && Receta.favorito == true);
    else
      datosElegidos = recetaProvider.LeerRecetas().values.where((Receta) => Receta.almuerzo == true);

    return datosElegidos;
  }
}