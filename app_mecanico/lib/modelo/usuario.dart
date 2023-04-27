//import 'package:hive/hive.dart';

//@HiveType(typeId: 0)
class Producto {
  //@HiveField(0)
  String nombre = '';
  //@HiveField(1)
  String correo = '';
  //@HiveField(2)
  String contra = '';
  bool admin = false;

  Producto({
    required this.nombre,
    required this.correo,
    required this.contra,
  }) {}

  Map<String, dynamic> toMap() {
    return {
      'nombre': nombre,
      'correo': correo,
      'contra': contra,
    };
  }
  
  @override
  String toString() {
    return 'Usuario: $nombre';
  }

}
/*
class ProdAdapter extends TypeAdapter<Producto>{
  @override
  Producto read(BinaryReader reader) {
    return Producto(
      codigo: reader.read(), 
      nombre: reader.read(),
      precio: reader.read(),
      );
  }

  @override
  int get typeId => 0;

  @override
  void write(BinaryWriter writer, Producto obj) {
    writer.write(obj.codigo);
    writer.write(obj.nombre);
    writer.write(obj.precio);
  }

}*/