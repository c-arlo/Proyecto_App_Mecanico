import 'package:app_mecanico/vistas/Vlistcitas.dart';
import 'package:app_mecanico/vistas/Vlistclientes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:app_mecanico/reporte/reg_cliente.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Vlistreport extends StatefulWidget {
  const Vlistreport({
    super.key,
  });

  @override
  State<Vlistreport> createState() => _VlistreportState();
}

var box = Hive.box('Citas');
List<String> fecha = [];

class _VlistreportState extends State<Vlistreport> {
  void _estado(){
    setState((){});
  }

  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
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
      drawer: Drawer(
        backgroundColor: Color(0xFF1C488D),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: BoxDecoration(color: Colors.white),
              padding: EdgeInsets.symmetric(vertical: 50),
              child: Column(
                children: [
                  Icon(
                    Icons.account_circle,
                    size: 90,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text('¡Bienvenido!',style: GoogleFonts.rubik(fontSize: 20),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  children: [
                    ElevatedButton(
                      onPressed: null,
                      style: ElevatedButton.styleFrom(
                        disabledForegroundColor: Colors.grey,
                        backgroundColor: Color(0xFF1C488D),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0.0)),
                      ),
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.list_alt,
                              size: 40,
                            ),
                            Text(' Reportes',style: GoogleFonts.rubik(fontSize: 22),
                            ),
                          ],
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: (){
                        Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const Vlistcitas();
                          }));
                      },
                      style: ElevatedButton.styleFrom(
                        disabledForegroundColor: Colors.grey,
                        backgroundColor: Color(0xFF1C488D),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0.0)),
                      ),
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.contacts,
                              size: 40,
                            ),
                            Text(
                              ' Citas',
                              style: GoogleFonts.rubik(fontSize: 22),
                            ),
                          ],
                        ),
                      ),
                    ),
                    
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const Vlistclientes();
                          }));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF1C488D),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0.0)),
                      ),
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.group,
                              size: 40,
                            ),
                            Text(
                              ' Clientes',
                              style: GoogleFonts.rubik(fontSize: 22),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF1C488D),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0.0)),
              ),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.logout,
                      size: 40,
                    ),
                    Text(
                      ' Cerrar Sesion',
                      style: GoogleFonts.rubik(fontSize: 22),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      body: Container(
            padding: EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 10,),
                Text('Listado de Reportes',style: GoogleFonts.rubik(fontSize: 25,color: Colors.white),),
                SizedBox(height: 10,),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                    ],
                  ),
                ),
                SizedBox(height: 10,),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                  ),
                ),
              ],
            ),
          ),
      floatingActionButton: FloatingActionButton.large(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const registrarcl();
          })).then((value) => _estado());
        },
        child: Icon(Icons.add),
        backgroundColor: Color(0xFFD3A518),
      ),
    );
  }
}
