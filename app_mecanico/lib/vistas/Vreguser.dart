import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Vreguser extends StatefulWidget {
  const Vreguser({super.key,});
  
  @override
  State<Vreguser> createState() => _VreguserState();
}

var box = Hive.box('usuarios');

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
      backgroundColor: Color(0xFF1C488D),
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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              'assets/logo.png',
              width: 250,
              height: 250,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Ingrese los datos del nuevo usuario',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.rubik(
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                      fontSize: 18,
                      
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextField(
                    style: GoogleFonts.rubik(fontSize: 18,),
                    controller: nombreCtrl,
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Nombre de Usuario',
                      helperText: 'Evitar usar caracteres especiales (@,\$,#,%,&)'
                    ),
                  ),
                  TextField(
                    style: GoogleFonts.rubik(fontSize: 18),
                    controller: correoCtrl,
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Correo',
                      helperText: 'ejemplo@correo.com'
                    ),
                  ),
                  TextField(
                    style: GoogleFonts.rubik(fontSize: 18),
                    controller: contraCtrl,
                    obscureText: true,
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Contraseña',
                      helperText: 'Evitar usar caracteres especiales (@,\$,#,%,&)'
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Cancelar'),
                        style: ElevatedButton.styleFrom(
                            shape: StadiumBorder(),
                            foregroundColor: Colors.white,
                            textStyle: GoogleFonts.rubik(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                            backgroundColor: Color(0xFFD3A518)
                            ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Map<String,dynamic> m = {
                                'user':nombreCtrl.text,
                                'correo':correoCtrl.text,
                                'contra':contraCtrl.text,
                              };
                              box.add(m);
                              showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: Row(
                              children: [
                                Icon(
                                  Icons.check_circle,
                                  color: Colors.green
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text('Confirmacion'),
                              ]),
                            content:
                                const Text('¡Usuario Registrado!'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text('OK'),
                              ),
                            ],
                          ),
                        ).then((value) => Navigator.pop(context));
                        },
                        child: const Text('Registrarse'),
                        style: ElevatedButton.styleFrom(
                            shape: StadiumBorder(),
                            foregroundColor: Colors.white,
                            textStyle: GoogleFonts.rubik(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                            backgroundColor: Colors.cyan),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Text(
              'Copyright © 2023 Overcom - Todos los derechos reservados',
              style: GoogleFonts.rubik(
                fontSize: 11,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
