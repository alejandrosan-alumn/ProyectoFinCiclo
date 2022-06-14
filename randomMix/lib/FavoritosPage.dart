import 'package:flutter/material.dart';
import 'package:randommix/EditarReceta.dart';
import 'package:randommix/provider/RecetaProvider.dart';

class FavoritosPage extends StatefulWidget{

  @override
  State<FavoritosPage> createState() => _FavoritosPage();
}

class _FavoritosPage extends State<FavoritosPage>{

  var recetaProvider = RecetaProvider();

  @override
  void dispose(){
    super.dispose();
    recetaProvider.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Mis recetas favoritas"),
      ),
      body: FutureBuilder(
          future: recetaProvider.InicializarBox(),
          builder: (context, snapShot){
            if(snapShot.connectionState == ConnectionState.done){
              return (recetaProvider.box.length < 1) ? Container() : LeerRecetasFavoritas(context);
            }
            return Container();
          }
      ),
    );
  }

  ListView LeerRecetasFavoritas(BuildContext context) {

    var recetasMap = recetaProvider.LeerRecetas();
    var recetasFavoritas = recetasMap.values.where((Receta) => Receta.almuerzo == true && Receta.favorito == true);
    //var clavesRecetas = recetasFavoritas.keys;

    return ListView.builder(
        itemCount: recetasFavoritas.length,
        itemBuilder: (context, indiceRecetas){
          //var claveReceta = clavesRecetas.elementAt(indiceRecetas);
          var receta = recetasFavoritas.elementAt(indiceRecetas);
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
              )
          );
        }
    );
  }
}