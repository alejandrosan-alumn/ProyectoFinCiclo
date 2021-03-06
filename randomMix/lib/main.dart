import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:randommix/HomePage.dart';
import 'package:randommix/RecetarioPage.dart';
import 'package:randommix/Datos/Receta.dart';
import 'package:randommix/FavoritosPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Hive.registerAdapter(RecetaAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RandomMix',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(title: 'RandomMix'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int indiceActual = 0;
  final Pantallas =[
    HomePage(),
    RecetarioPage(),
    FavoritosPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Pantallas[indiceActual],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.red,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.white,
        iconSize: 50,
        currentIndex:indiceActual,
        onTap: (index) =>setState(() => indiceActual = index),
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Recetario',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Recetas favoritas',
            backgroundColor: Colors.amber,
          ),
        ],
      ),
    );
  }
}
