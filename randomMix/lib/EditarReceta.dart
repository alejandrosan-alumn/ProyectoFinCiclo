import 'package:flutter/material.dart';
import 'package:randommix/Datos/Receta.dart';
import 'package:randommix/provider/RecetaProvider.dart';

class EditarReceta extends StatefulWidget {

  final receta;
  final int? indiceReceta;
  final bool editar;


  EditarReceta(this.receta, this.indiceReceta, this.editar);

  @override
  _EditarReceta createState() => _EditarReceta();

}

class _EditarReceta extends State<EditarReceta>{

  var recetaProvider = RecetaProvider();

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final _formKey = GlobalKey<FormState>();
    recetaProvider.InicializarBox();

    return Scaffold(
      appBar: AppBar(
        title: widget.indiceReceta!=null ? Text('${widget.receta.nombreReceta}') : Text('Nueva receta')
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(labelText: 'Nombre de la receta'),
              initialValue: '${widget.receta.nombreReceta}',
              onSaved: (nuevoNombre) => widget.receta.nombreReceta = nuevoNombre!,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Descripción de la receta'),
              initialValue: widget.receta.detalles,
              onSaved: (nuevosDetalles) => widget.receta.detalles = nuevosDetalles!,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'ingredientes de la receta'),
              initialValue: widget.receta.ingredientes,
              onSaved: (nuevosIngredientes) => widget.receta.ingredientes = nuevosIngredientes!,
            ),
            CheckboxListTile(
              title: Text("Receta para almorzar"),
              value: widget.receta.almuerzo,
              onChanged: (cambioAlmuerzo) => widget.receta.almuerzo = cambioAlmuerzo!,
              controlAffinity: ListTileControlAffinity.leading,
            ),
            CheckboxListTile(
              title: Text("Receta para cenar"),
              value: widget.receta.cena,
              onChanged: (cambioCena) => widget.receta.cena = cambioCena!,
              controlAffinity: ListTileControlAffinity.leading,
            ),
            CheckboxListTile(
              title: Text("Receta para intolerantes"),
              value: widget.receta.lacteos,
              onChanged: (cambioLacteos) => widget.receta.lacteos = cambioLacteos!,
              controlAffinity: ListTileControlAffinity.leading,
            ),
            CheckboxListTile(
              title: Text("Receta para veganos"),
              value: widget.receta.vegano,
              onChanged: (cambioVegano) => widget.receta.vegano = cambioVegano!,
              controlAffinity: ListTileControlAffinity.leading,
            ),
          ]
        ),
      ),
      floatingActionButton: IconButton(
        icon: Icon(Icons.save),
        onPressed: (){
          _formKey.currentState!.save();
          (widget.editar) ? IntroducirReceta(widget.receta) : ActualizarReceta(widget.indiceReceta!, widget.receta);
        }
      )
    );
  }

  IntroducirReceta(var receta) {
    recetaProvider.NuevaReceta(receta);
    Navigator.pushNamed(context, '/');
  }

  ActualizarReceta(int i, var receta) {
    recetaProvider.ModificarReceta(i, receta);
    Navigator.pushNamed(context, '/');
  }
}