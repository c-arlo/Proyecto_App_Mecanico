import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Vreguser extends StatefulWidget {
  const Vreguser({super.key,});
  
  @override
  State<Vreguser> createState() => _VreguserState();
}

class _VreguserState extends State<Vreguser> {
  final TextEditingController nombreCtrl = TextEditingController();
  final TextEditingController correoCtrl = TextEditingController();
  final TextEditingController contraCtrl = TextEditingController();

  void _estado(){
    setState((){});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        toolbarHeight: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
        ),
        elevation: 0,
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextField(
            controller: nombreCtrl,
            decoration: const InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(),
              labelText: 'Nombre de Usuario',
            ),
          ),

          TextField(
            controller: correoCtrl,
            decoration: const InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(),
              labelText: 'Correo',
            ),
          ),
          
          TextField(
            controller: contraCtrl,
            decoration: const InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(),
              labelText: 'Contraseña',
            ),
            obscureText: true,
          ),
        ],
      ),
    );
  }
}
