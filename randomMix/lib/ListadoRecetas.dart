import 'package:flutter/material.dart';
import 'package:randommix/Datos/Receta.dart';

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
          Navigator.pushNamed(context, "/editar", arguments: Receta(id,nombreReceta,detalles=,ingredientes=,
              almuerzo,cena,lacteos, vegano, favorito));
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
  List<Receta> recetas = [];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: recetas.length,
        itemBuilder: (context, i) =>
            Dismissible(key: Key(i.toString()),
              direction: DismissDirection.startToEnd,
              background: Container(
                  color: Colors.red,
                  padding: EdgeInsets.only(left: 5),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Icon(Icons.delete, color: Colors.white)
                  )
              ),
              onDismissed: (direction) {

              },
              child: ListTile(
                title: Text(recetas[i].nombreReceta),
                trailing: MaterialButton(
                    onPressed: () {
                      Navigator.pushNamed(
                          context, "/editar", arguments: recetas[i]);
                    },
                    child: Icon(Icons.edit)
                ),
              ),
            )
    );
  }
}