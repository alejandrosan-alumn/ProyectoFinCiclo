import 'package:flutter/material.dart';
import 'package:randommix/Datos/Receta.dart';
import 'package:randommix/EditarReceta.dart';
import 'package:randommix/provider/RecetaProvider.dart';

class ListadoRecetas extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de recetas"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          var nuevaReceta = Receta("", "", "", false, false, false, false, false);
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => EditarReceta(nuevaReceta, null, true)));
        },
      ),
      body: Container(
        child: Listado()
      )
    );
  }
}

class Listado extends StatefulWidget {

  @override
  _Listado createState() => _Listado();
}

class _Listado extends State<Listado> {
  var recetaProvider = RecetaProvider();

  @override
  void dispose(){
    super.dispose();
    recetaProvider.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: FutureBuilder(
        future: recetaProvider.InicializarBox(),
        builder: (context, snapShot){
          if(snapShot.connectionState == ConnectionState.done){
            return (recetaProvider.box.length < 1) ? Container() : LeerRecetas(context);
          }
          return Container();
        }
      ),
    );
  }

  ListView LeerRecetas(BuildContext context){
    var recetasMap = recetaProvider.LeerRecetas();
    var clavesRecetas = recetasMap.keys;

    return ListView.builder(
      itemCount: recetasMap.length,
      itemBuilder: (context, indiceRecetas){
        var claveReceta = clavesRecetas.elementAt(indiceRecetas);
        var receta = recetasMap[claveReceta];
        return Container(
          decoration: BoxDecoration(border: Border.all(color: Colors.black38)),
          child: ListTile(
            title: GestureDetector(
              child: Text(
                '${receta.nombreReceta}',
                style: TextStyle(fontWeight: FontWeight.bold)
              ),
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => EditarReceta(receta, indiceRecetas, false)));
              }
            ),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: (){
                EliminarReceta(indiceRecetas);
                setState(() {});
              },
            )
          )
        );
      }
    );
  }

  void EliminarReceta(int indice){
    recetaProvider.EliminarReceta(indice);
  }
}