import 'package:hive_flutter/adapters.dart';

@HiveType(typeId: 0)
class Cliente {
  @HiveField(0)
  String nombre;
  @HiveField(1)
  String telefono;
  @HiveField(2)
  String direccion;
  @HiveField(3)
  Carro carro;

  Cliente({
    required this.nombre,
    required this.telefono,
    required this.direccion,
    required this.carro,
  });
}

@HiveType(typeId: 1)
class Carro {
  @HiveField(0)
  String marca;
  @HiveField(1)
  String modelo;
  @HiveField(2)
  String ano;
  @HiveField(3)
  String vin;
  @HiveField(4)
  String color;
  @HiveField(5)
  String kil;
  @HiveField(6)
  String placa;
  @HiveField(7)
  String obs;
  @HiveField(8)
  List<Reporte> reportes;

  Carro({
    required this.marca,
    required this.modelo,
    required this.ano,
    required this.vin,
    required this.color,
    required this.kil,
    required this.placa,
    required this.obs,
    required this.reportes,
  });
}

@HiveType(typeId: 2)
class Reporte {
  @HiveField(0)
  List<String> afinacion;
  @HiveField(1)
  List<String> frenos;
  @HiveField(2)
  List<String> direccion;
  @HiveField(3)
  List<String> suspencion;
  @HiveField(4)
  List<String> motor;
  @HiveField(5)
  List<String> enfriamiento;

  Reporte({
    required this.afinacion,
    required this.frenos,
    required this.direccion,
    required this.suspencion,
    required this.motor,
    required this.enfriamiento,
  });
}

class ClienteAdapter extends TypeAdapter<Cliente> {
  @override
  Cliente read(BinaryReader reader) {
    return Cliente(
      nombre: reader.read(),
      telefono: reader.read(),
      direccion: reader.read(),
      carro: reader.read(),
    );
  }

  int get typeId => 0;

  @override
  void write(BinaryWriter writer, Cliente obj) {
    writer.write(obj.nombre);
    writer.write(obj.telefono);
    writer.write(obj.direccion);
    writer.write(obj.carro);
  }
}

class CarroAdapter extends TypeAdapter<Carro> {
  @override
  Carro read(BinaryReader reader) {
    return Carro(
      marca: reader.read(),
      modelo: reader.read(),
      ano: reader.read(),
      vin: reader.read(),
      color: reader.read(),
      kil: reader.read(),
      placa: reader.read(),
      obs: reader.read(),
      reportes: List<Reporte>.from(reader.read()),
    );
  }

  int get typeId => 1;

  @override
  void write(BinaryWriter writer, Carro obj) {
    writer.write(obj.marca);
    writer.write(obj.modelo);
    writer.write(obj.ano);
    writer.write(obj.vin);
    writer.write(obj.color);
    writer.write(obj.kil);
    writer.write(obj.placa);
    writer.write(obj.obs);
    writer.write(obj.reportes);
  }
}

class ReporteAdapter extends TypeAdapter<Reporte> {
  @override
  Reporte read(BinaryReader reader) {
    return Reporte(
      afinacion: reader.read(),
      frenos: reader.read(),
      direccion: reader.read(),
      suspencion: reader.read(),
      motor: reader.read(),
      enfriamiento: List<String>.from(reader.read()),
    );
  }

  int get typeId => 2;

  @override
  void write(BinaryWriter writer, Reporte obj) {
    writer.write(obj.afinacion);
    writer.write(obj.frenos);
    writer.write(obj.direccion);
    writer.write(obj.suspencion);
    writer.write(obj.motor);
    writer.write(obj.enfriamiento);
  }
}
