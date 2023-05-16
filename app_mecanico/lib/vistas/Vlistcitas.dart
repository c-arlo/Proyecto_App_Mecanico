import 'package:app_mecanico/main.dart';
import 'package:app_mecanico/vistas/Vaddcita.dart';
import 'package:app_mecanico/vistas/Vlistclientes.dart';
import 'package:app_mecanico/vistas/Vlistreport.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';

class Vlistcitas extends StatefulWidget {
  const Vlistcitas({
    super.key,
  });

  @override
  State<Vlistcitas> createState() => _VlistcitasState();
}

class _VlistcitasState extends State<Vlistcitas> {
  var box = Hive.box('Citas');
  void _estado() {
    setState(() {});
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
                  Text(
                    '¡Bienvenido !',
                    style: GoogleFonts.rubik(fontSize: 20),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const Vlistreport();
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
                              Icons.list_alt,
                              size: 40,
                            ),
                            Text(
                              ' Reportes',
                              style: GoogleFonts.rubik(fontSize: 22),
                            ),
                          ],
                        ),
                      ),
                    ),
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
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const MyApp();
                })).then((value) => _estado());
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
        padding: EdgeInsets.only(top: 30, left: 15, right: 15, bottom: 60),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  Icons.edit_calendar,
                  size: 40,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: Text(
                  'Listado de Citas',
                  style: GoogleFonts.rubik(fontSize: 25, color: Colors.white),
                )),
                ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        shape: CircleBorder(), backgroundColor: Colors.cyan),
                    child: Container(
                      padding: EdgeInsets.all(20),
                      child: Icon(Icons.calendar_month),
                    ))
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: ListView(
                  children: box.values
                      .toList()
                      .map((e) => Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: ExpansionTile(
                              leading: Icon(Icons.contacts),
                              controlAffinity: ListTileControlAffinity.leading,
                              title: Text(
                                e['nombre'] +
                                    " " +
                                    e['appat'] +
                                    " " +
                                    e['apmat'],
                                style: GoogleFonts.rubik(fontSize: 18),
                              ),
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(Icons.phone),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text(e['tel'],
                                        style: GoogleFonts.rubik(fontSize: 18),
                                        textAlign: TextAlign.left),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.calendar_month),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      e['fecha'],
                                      style: GoogleFonts.rubik(fontSize: 18),
                                      textAlign: TextAlign.left,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ))
                      .toList(),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.large(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const Vaddcita();
          })).then((value) => _estado());
        },
        child: Icon(Icons.add),
        backgroundColor: Color(0xFFD3A518),
      ),
    );
  }
}
