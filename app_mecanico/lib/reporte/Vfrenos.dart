import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:group_button/group_button.dart';
import 'Vafinacion.dart';
import 'Vdireccion.dart';
import 'Vsuspencion.dart';

import 'ClienteControlador.dart';
import 'Reporte.dart';

class Vfrenos extends StatefulWidget {
  ClienteControlador clientec;

  Vfrenos({
    super.key,
    required this.clientec,
  });

  @override
  State<Vfrenos> createState() => _Vfrenos();
}

class _Vfrenos extends State<Vfrenos> {
  List<String> opciones = ['✓', '✗', 'fs'];
  TextEditingController controller = TextEditingController();
  List<GroupButtonController>? controladores;

  @override
  void initState() {
    super.initState();
    controladores = List.generate(34, (index) => GroupButtonController());
    for (int i = 0; i < widget.clientec.reporte!.frenos.length; i++) {
      if (widget.clientec.reporte!.frenos[i] == '✓') {
        controladores![i].selectIndex(0);
      } else if (widget.clientec.reporte!.frenos[i] == '✗') {
        controladores![i].selectIndex(1);
      } else if (widget.clientec.reporte!.frenos[i] == 'fs') {
        controladores![i].selectIndex(2);
      }
    }
  }

  @override
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
                  image: AssetImage('assets/frenos.jpg'),
                  fit: BoxFit.fitWidth)),*/
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          widget.clientec.actualizarReporte();
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Vdireccion(
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
              'Servico De Frenos',
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
                    title: Text('Balatas Delanteras:'),
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
                                Text('Si'),
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('1/4'),
                                GroupButton(
                                    controller: controladores![2],
                                    buttons: opciones),
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('3/4'),
                                GroupButton(
                                    controller: controladores![3],
                                    buttons: opciones),
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('2/4'),
                                GroupButton(
                                    controller: controladores![4],
                                    buttons: opciones),
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('Vida Util'),
                                GroupButton(
                                    controller: controladores![5],
                                    buttons: opciones),
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('Vias Capiler'),
                                GroupButton(
                                    controller: controladores![6],
                                    buttons: opciones),
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('Disco'),
                                GroupButton(
                                    controller: controladores![7],
                                    buttons: opciones),
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('Rectificacion'),
                                GroupButton(
                                    controller: controladores![8],
                                    buttons: opciones),
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('Izquierdo'),
                                GroupButton(
                                    controller: controladores![9],
                                    buttons: opciones),
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('Derecho'),
                                GroupButton(
                                    controller: controladores![10],
                                    buttons: opciones),
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('Capiler'),
                                GroupButton(
                                    controller: controladores![11],
                                    buttons: opciones),
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('Normal'),
                                GroupButton(
                                    controller: controladores![12],
                                    buttons: opciones),
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('Goteo'),
                                GroupButton(
                                    controller: controladores![13],
                                    buttons: opciones),
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('Izquierdo'),
                                GroupButton(
                                    controller: controladores![14],
                                    buttons: opciones),
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('Derecho'),
                                GroupButton(
                                    controller: controladores![15],
                                    buttons: opciones),
                              ],
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
                    title: Text('Zapatas O Balatas Traseras:'),
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
                                Text('Si'),
                                GroupButton(
                                    controller: controladores![16],
                                    buttons: opciones),
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('No'),
                                GroupButton(
                                    controller: controladores![17],
                                    buttons: opciones),
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('1/4'),
                                GroupButton(
                                    controller: controladores![18],
                                    buttons: opciones),
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('3/4'),
                                GroupButton(
                                    controller: controladores![19],
                                    buttons: opciones),
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('2/4'),
                                GroupButton(
                                    controller: controladores![20],
                                    buttons: opciones),
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('Vida Util'),
                                GroupButton(
                                    controller: controladores![21],
                                    buttons: opciones),
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('Vias Capiler'),
                                GroupButton(
                                    controller: controladores![22],
                                    buttons: opciones),
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('Disco'),
                                GroupButton(
                                    controller: controladores![23],
                                    buttons: opciones),
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('Tambor'),
                                GroupButton(
                                    controller: controladores![24],
                                    buttons: opciones),
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('Rectificacion'),
                                GroupButton(
                                    controller: controladores![25],
                                    buttons: opciones),
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('Izquierdo'),
                                GroupButton(
                                    controller: controladores![26],
                                    buttons: opciones),
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('Derecho'),
                                GroupButton(
                                    controller: controladores![27],
                                    buttons: opciones),
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('Capiler'),
                                GroupButton(
                                    controller: controladores![28],
                                    buttons: opciones),
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('Capiler'),
                                GroupButton(
                                    controller: controladores![29],
                                    buttons: opciones),
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('Normal'),
                                GroupButton(
                                    controller: controladores![30],
                                    buttons: opciones),
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('Goteo'),
                                GroupButton(
                                    controller: controladores![31],
                                    buttons: opciones),
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('Izquierdo'),
                                GroupButton(
                                    controller: controladores![32],
                                    buttons: opciones),
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('Derecho'),
                                GroupButton(
                                    controller: controladores![33],
                                    buttons: opciones),
                              ],
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
                    title: Text('Observaciones:'),
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
