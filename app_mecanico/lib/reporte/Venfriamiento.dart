import 'package:app_mecanico/reporte/Mreporte.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:group_button/group_button.dart';
import 'Reporte.dart';

import 'ClienteControlador.dart';

class Venfriamiento extends StatefulWidget {
  ClienteControlador clientec;

  Venfriamiento({
    super.key,
    required this.clientec,
  });

  @override
  State<Venfriamiento> createState() => _Venfriamiento();
}

class _Venfriamiento extends State<Venfriamiento> {
  List<String> opciones = ['✓', '✗', 'fs'];
  TextEditingController controller = TextEditingController();
  List<GroupButtonController>? controladores;
  @override
  void initState() {
    super.initState();
    controladores = List.generate(18, (index) => GroupButtonController());
    for (int i = 0; i < widget.clientec.reporte!.enfriamiento.length; i++) {
      if (widget.clientec.reporte!.enfriamiento[i] == '✓') {
        controladores![i].selectIndex(0);
      } else if (widget.clientec.reporte!.enfriamiento[i] == '✗') {
        controladores![i].selectIndex(1);
      } else if (widget.clientec.reporte!.enfriamiento[i] == 'fs') {
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
                  image: AssetImage('assets/enfriamiento.png'),
                  fit: BoxFit.fitWidth)),*/
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          widget.clientec.actualizarReporte();
          print(widget.clientec.reporte!);
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Mreporte(
                        clientec: widget.clientec,
                      )
              )
          );
        },
        child: Icon(Icons.navigate_next_outlined),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Servico De Enfriamiento',
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
                    title: Text('Radiador Tapado:'),
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
                    title: Text('Anticongelante:'),
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
                            )
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
                    title: Text('Agua:'),
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
                            )
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
                    title: Text('Bomba de agua fuga:'),
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
                            )
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
                    title: Text('Termostato:'),
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
                                    controller: controladores![8],
                                    buttons: opciones),
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('No'),
                                GroupButton(
                                    controller: controladores![9],
                                    buttons: opciones),
                              ],
                            )
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
                    title: Text('Mangueras rotas:'),
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
                                    controller: controladores![10],
                                    buttons: opciones),
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('No'),
                                GroupButton(
                                    controller: controladores![11],
                                    buttons: opciones),
                              ],
                            )
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
                    title: Text('Rdiador Tapado:'),
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
                                    controller: controladores![12],
                                    buttons: opciones),
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('No'),
                                GroupButton(
                                    controller: controladores![13],
                                    buttons: opciones),
                              ],
                            )
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
                    title: Text('Abrazaderas Rotas:'),
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
                                    controller: controladores![14],
                                    buttons: opciones),
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('No'),
                                GroupButton(
                                    controller: controladores![15],
                                    buttons: opciones),
                              ],
                            )
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
                    title: Text('Deposito roto:'),
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
                            )
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
