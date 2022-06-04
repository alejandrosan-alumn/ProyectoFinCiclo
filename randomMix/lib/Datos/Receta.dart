
class Receta{

  int id;
  String nombreReceta;
  String detalles;
  String ingredientes;
  bool almuerzo;
  bool cena;
  bool lacteos;
  bool vegano;
  bool favorito;


  Receta(this.id, this.nombreReceta, this.detalles, this.ingredientes,
      this.almuerzo, this.cena, this.lacteos, this.vegano, this.favorito);

  Map<String, dynamic> toMap(){

    return{
      'id':id,
      'nombreReceta':nombreReceta,
      'detalles':detalles,
      'ingredientes':ingredientes,
      'almuerzo':almuerzo,
      'cena':cena,
      'lacteos':lacteos,
      'vegano':vegano,
      'favorito':favorito
    };
  }
}