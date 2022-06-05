import 'package:hive/hive.dart';

part 'Receta.g.dart';

@HiveType(typeId: 0)
class Receta{

  @HiveField(0)
  String nombreReceta;
  @HiveField(1)
  String detalles;
  @HiveField(2)
  String ingredientes;
  @HiveField(3)
  bool almuerzo;
  @HiveField(4)
  bool cena;
  @HiveField(5)
  bool lacteos;
  @HiveField(6)
  bool vegano;
  @HiveField(7)
  bool favorito;


  Receta(this.nombreReceta, this.detalles, this.ingredientes,
      this.almuerzo, this.cena, this.lacteos, this.vegano, this.favorito);

}