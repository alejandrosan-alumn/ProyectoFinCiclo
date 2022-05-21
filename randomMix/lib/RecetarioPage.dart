import 'package:flutter/material.dart';

class RecetarioPage extends StatefulWidget{
  @override
  State<RecetarioPage> createState() => _RecetarioPage();
  
}
class _RecetarioPage extends State<RecetarioPage>{
  @override
  Widget build(BuildContext context) => Scaffold(

      appBar: AppBar(
        title: Text('Recetario personal'),
      ),
      body: Center(
        child: Text('Recetario personal',
        ),
      )
  );
}