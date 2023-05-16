import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:group_button/group_button.dart';
import 'Reporte.dart';
import 'Venfriamiento.dart';
import 'Vmotor.dart';
import 'Vsuspencion.dart';
import 'ClienteControlador.dart';
import 'Vafinacion.dart';

class Vdireccion extends StatefulWidget {
  ClienteControlador clientec;

  Vdireccion({
    super.key,
    required this.clientec,
  });

  @override
  State<Vdireccion> createState() => _Vdireccion();
}

class _Vdireccion extends State<Vdireccion> {
  List<String> opciones = ['✓', '✗', 'fs'];
  TextEditingController controller = TextEditingController();
  List<GroupButtonController>? controladores;
  @override
  void initState() {
    super.initState();
    controladores = List.generate(10, (index) => GroupButtonController());
    for (int i = 0; i < widget.clientec.reporte!.direccion.length; i++) {
      if (widget.clientec.reporte!.direccion[i] == '✓') {
        controladores![i].selectIndex(0);
      } else if (widget.clientec.reporte!.direccion[i] == '✗') {
        controladores![i].selectIndex(1);
      } else if (widget.clientec.reporte!.direccion[i] == 'fs') {
        controladores![i].selectIndex(2);
      }
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 169, 170, 171),
      appBar: AppBar(
        automaticallyImplyLeading: true,
        toolbarHeight: 100,
        centerTitle: true,
        flexibleSpace: Container(
          /*decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/direccion.jpg'),
                  fit: BoxFit.fitWidth)),*/
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          widget.clientec.actualizarReporte();
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Vsuspencion(
                        clientec: widget.clientec,
                      )));
        },
        child: Icon(Icons.navigate_next_outlined),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Servico De Dirección',
              textAlign: TextAlign.center,
              style: GoogleFonts.laila(fontSize: 20),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  ExpansionTile(
                    title: Text('Fuga. Bomba De Dirección Hidráulica:'),
                    trailing: Icon(Icons.arrow_drop_down),
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(3, 210, 255, 1),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('SI'),
                                GroupButton(
                                    controller: controladores![0],
                                    buttons: opciones),
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('No'),
                                GroupButton(
                                    controller: controladores![1],
                                    buttons: opciones),
                              ],
                            ),
                            SizedBox(height: 20),
                            Text('Con ruido: '),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('Si '),
                                GroupButton(
                                    controller: controladores![2],
                                    buttons: opciones),
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('No'),
                                GroupButton(
                                    controller: controladores![3],
                                    buttons: opciones),
                              ],
                            ),
                            SizedBox(height: 20),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  ExpansionTile(
                    title: Text('Linea De Alta Presión. Manguera Rota:'),
                    trailing: Icon(Icons.arrow_drop_down),
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(3, 210, 255, 1),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: Column(
                          children: [
                            Text('Con fuga de aceite'),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('Si'),
                                GroupButton(
                                    controller: controladores![4],
                                    buttons: opciones),
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('No'),
                                GroupButton(
                                    controller: controladores![5],
                                    buttons: opciones),
                              ],
                            ),
                            SizedBox(height: 20),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  ExpansionTile(
                    title: Text('Linea De Retorno. Manguera Rota:'),
                    trailing: Icon(Icons.arrow_drop_down),
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(3, 210, 255, 1),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: Column(
                          children: [
                            Text('Con fuga de aceite'),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('Si'),
                                GroupButton(
                                    controller: controladores![6],
                                    buttons: opciones),
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('No'),
                                GroupButton(
                                    controller: controladores![7],
                                    buttons: opciones),
                              ],
                            ),
                            SizedBox(height: 20),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  ExpansionTile(
                    title: Text('Cremallera De La Dirección:'),
                    trailing: Icon(Icons.arrow_drop_down),
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(3, 210, 255, 1),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('Izquierda'),
                                GroupButton(
                                    controller: controladores![8],
                                    buttons: opciones),
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('Derecha'),
                                GroupButton(
                                    controller: controladores![9],
                                    buttons: opciones),
                              ],
                            ),
                            SizedBox(height: 20),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  ExpansionTile(
                    title: Text('Obervaciones:'),
                    trailing: Icon(Icons.arrow_drop_down),
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(3, 210, 255, 1),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: Column(
                          children: [
                            TextField(
                              controller: controller,
                              maxLines: null,
                              decoration:
                                  InputDecoration(hintText: 'Escribi aqui...'),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
