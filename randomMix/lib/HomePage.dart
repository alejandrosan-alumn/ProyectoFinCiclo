import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{
  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage>{
  @override
  Widget build(BuildContext context) => Scaffold(

    appBar: AppBar(
      title: Text('Selección aleatoria'),
    ),
    body: Center(
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
                  onPressed: (){},
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
                    onPressed: (){},
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
    )
  );


}