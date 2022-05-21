import 'package:flutter/material.dart';

class FiltrosPage extends StatefulWidget{

  @override
  State<FiltrosPage> createState() => _FiltrosPage();
}

class _FiltrosPage extends State<FiltrosPage>{
  @override
  Widget build(BuildContext context) => Scaffold(

    appBar: AppBar(
      title: Text('Página de filtros'),
    ),
    body: Center(
      child: Text('Filtros'),
    ),
  );
}