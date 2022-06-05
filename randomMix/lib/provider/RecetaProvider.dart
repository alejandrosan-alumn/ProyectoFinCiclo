import 'package:path_provider/path_provider.dart';
import 'package:hive/hive.dart';

class RecetaProvider{

  late Box box;

  Future<bool> InicializarBox() async{
    final directorio = await getApplicationSupportDirectory();
    Hive.init(directorio.path);
    box = await Hive.openBox('recetasBox');
    return box.isOpen;
  }

  Future<bool> NuevaReceta(var receta) async{
    await box.add(receta);
    return true;
  }

  Map<dynamic, dynamic> LeerRecetas(){
    Map<dynamic, dynamic> recetasMap = box.toMap();
    return recetasMap;
  }

  Future<bool> EliminarReceta(int indice) async{
    await box.deleteAt(indice);
    return true;
  }

  Future<bool> ModificarReceta(int indice, var receta) async{
    await box.putAt(indice, receta);
    return true;
  }

  dispose(){
    box.close();
  }
}