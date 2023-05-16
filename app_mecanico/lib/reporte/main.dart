/*import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:programacion/Vdireccion.dart';
import 'package:group_button/group_button.dart';
import 'package:programacion/pagina_principal.dart';
import 'package:programacion/producto.dart';
import 'package:programacion/reg_categoria.dart';
import 'package:programacion/reg_cliente.dart';
import 'package:programacion/reg_productos.dart';
import 'package:programacion/reg_proveedor.dart';
import 'package:programacion/reg_vehiculo.dart';
import 'package:programacion/ver_productos.dart';

import 'Reporte.dart';
import 'Vafinacion.dart';
import 'Venfriamiento.dart';
import 'Vfrenos.dart';
import 'Vmotor.dart';

void main() async {
  runApp(const MyApp());
  await Hive.initFlutter();
  Hive.registerAdapter<Cliente>(ClienteAdapter());
  Hive.registerAdapter<Reporte>(ReporteAdapter());
  Hive.registerAdapter<Carro>(CarroAdapter());
  await Hive.openBox<Cliente>('clientes');

  ///for (int i = 0; i < widget.reporte.afinacion.lenght; i ++)
  // Container(child:Text(widget.reoporte.afinacion[i]))
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: principal(),
      debugShowCheckedModeBanner:
          false, //aquí se ejecutan las vistas que ando probando
    );
  }
}*/
