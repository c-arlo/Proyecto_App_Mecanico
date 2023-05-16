import 'package:app_mecanico/vistas/Vlistreport.dart';
import 'package:app_mecanico/vistas/Vreguser.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:app_mecanico/reporte/Reporte.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await Hive.initFlutter();
  await Hive.openBox('Clientes');
  await Hive.openBox('usuarios');
  await Hive.openBox('Citas');
  Hive.registerAdapter<Cliente>(ClienteAdapter());
  Hive.registerAdapter<Reporte>(ReporteAdapter());
  Hive.registerAdapter<Carro>(CarroAdapter());
  await Hive.openBox<Cliente>('clientes2');

  runApp(const MyApp());
  SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top]);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Proyecto Taller Mecanico',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

var box = Hive.box('usuarios');

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController userCtrl = TextEditingController();
  final TextEditingController contraCtrl = TextEditingController();
  
  void _estado() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
  bool error = true;
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
                    'Ingrese su usuario y contraseña',
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
                    controller: userCtrl,
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Usuario',
                    ),
                  ),
                  TextField(
                    style: GoogleFonts.rubik(fontSize: 18),
                    controller: contraCtrl,
                    obscureText: true,
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Contraseña',
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const Vreguser();
                          }));
                        },
                        child: Container(padding: EdgeInsets.symmetric(vertical:20),child: const Text('Registrarse')),
                        style: ElevatedButton.styleFrom(
                          shape: StadiumBorder(),
                            foregroundColor: Colors.white,
                            textStyle: GoogleFonts.rubik(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                            backgroundColor: Color(0xFFD3A518)),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          print(box.toMap());
                          box.toMap().forEach((key, value) {
                            if(value['user']==userCtrl.text){
                              error = false;
                            }
                          });
                          if(error==true){
                              showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: Row(
                              children: [
                                Icon(
                                  Icons.warning,
                                  color: Colors.red
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text('Error'),
                              ]),
                            content:
                                const Text('El usuario o contraseña estan incorrectos'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text('OK'),
                              ),
                            ],
                          ),
                        );
                          }
                          else if(error==false){Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const Vlistreport();
                          }));}
                          
                        },
                        child: Container(padding: EdgeInsets.symmetric(vertical: 20),child: const Text('Iniciar Sesión')),
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
                  ),/*
                  TextButton(
                    style: TextButton.styleFrom(
                      textStyle: TextStyle(
                        fontSize: 18,
                        color: Colors.blue,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    onPressed: () {},
                    child: const Text('¿Olvidaste tu contraseña?'),
                  ),*/
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
