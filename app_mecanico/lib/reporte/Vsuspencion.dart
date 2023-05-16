import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:group_button/group_button.dart';
import 'Vdireccion.dart';
import 'Vfrenos.dart';
import 'Vmotor.dart';

import 'ClienteControlador.dart';
import 'Reporte.dart';

class Vsuspencion extends StatefulWidget {
  ClienteControlador clientec;

  Vsuspencion({
    required this.clientec,
    super.key,
  });

  @override
  State<Vsuspencion> createState() => _Vsuspencion();
}

class _Vsuspencion extends State<Vsuspencion> {
  List<String> opciones = ['✓', '✗', 'fs'];
  TextEditingController controller = TextEditingController();
  List<GroupButtonController>? controladores;
  @override
  void initState() {
    super.initState();
    controladores = List.generate(22, (index) => GroupButtonController());
    for (int i = 0; i < widget.clientec.reporte!.suspencion.length; i++) {
      if (widget.clientec.reporte!.suspencion[i] == '✓') {
        controladores![i].selectIndex(0);
      } else if (widget.clientec.reporte!.suspencion[i] == '✗') {
        controladores![i].selectIndex(1);
      } else if (widget.clientec.reporte!.suspencion[i] == 'fs') {
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
                  image: AssetImage('assets/suspencion.jpg'),
                  fit: BoxFit.fitWidth)),*/
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          widget.clientec.actualizarReporte();

          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Vmotor(
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
            const SizedBox(height: 30),
            Text(
              'Servico De Suspención',
              textAlign: TextAlign.center,
              style: GoogleFonts.laila(fontSize: 20),
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
                    title: Text('Terminal Interior:'),
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
                                Text('Izquierdo'),
                                GroupButton(
                                    controller: controladores![0],
                                    buttons: opciones),
                              ],
                            ),
                            SizedBox(height: 20),
                            Text('Hules de la barra Ets'),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('Derecho'),
                                GroupButton(
                                    controller: controladores![1],
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
                    title: Text('Terminal exterior:'),
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
                                Text('Izquierdo'),
                                GroupButton(
                                    controller: controladores![2],
                                    buttons: opciones),
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('Izquierdo'),
                                GroupButton(
                                    controller: controladores![3],
                                    buttons: opciones),
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('Derecho'),
                                GroupButton(
                                    controller: controladores![4],
                                    buttons: opciones),
                              ],
                            ),
                            SizedBox(height: 20),
                            Text('Terminal Exterior:'),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('Derecho'),
                                GroupButton(
                                    controller: controladores![5],
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
                    title: Text('Rotula Inferior:'),
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
                                Text('Izquierdo'),
                                GroupButton(
                                    controller: controladores![6],
                                    buttons: opciones),
                              ],
                            ),
                            SizedBox(height: 20),
                            Text('Tornillos de la barra Ets'),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('Derecho'),
                                GroupButton(
                                    controller: controladores![7],
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
                    title: Text('Rotula Superior:'),
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
                                Text('Izquierdo'),
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
                            Text('Rotulo Superior:'),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('Derecho'),
                                GroupButton(
                                    controller: controladores![11],
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
                    title: Text('Amortiguadores Delanteros:'),
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
                                Text('Izquierdo'),
                                GroupButton(
                                    controller: controladores![12],
                                    buttons: opciones),
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('Derecho'),
                                GroupButton(
                                    controller: controladores![13],
                                    buttons: opciones),
                              ],
                            ),
                            SizedBox(height: 20),
                            Text('Gomas amortiguadores'),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('Delantero'),
                                GroupButton(
                                    controller: controladores![14],
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
                    title: Text('Amortiguadores Traseros:'),
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
                                Text('Izquierdo'),
                                GroupButton(
                                    controller: controladores![15],
                                    buttons: opciones),
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('Derecho'),
                                GroupButton(
                                    controller: controladores![16],
                                    buttons: opciones),
                              ],
                            ),
                            SizedBox(height: 20),
                            Text('Gomas amortiguadores'),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('Trasero'),
                                GroupButton(
                                    controller: controladores![17],
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
                    title: Text('Horquillas:'),
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
                                Text('Izquierdo'),
                                GroupButton(
                                    controller: controladores![18],
                                    buttons: opciones),
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('Derecho'),
                                GroupButton(
                                    controller: controladores![19],
                                    buttons: opciones),
                              ],
                            ),
                            SizedBox(height: 20),
                            Text('Bujes de Horquilla'),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('Trasero'),
                                GroupButton(
                                    controller: controladores![20],
                                    buttons: opciones),
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('Delantero'),
                                GroupButton(
                                    controller: controladores![21],
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
