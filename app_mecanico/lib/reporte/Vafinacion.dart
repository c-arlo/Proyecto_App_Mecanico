import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'ClienteControlador.dart';
import 'Vdireccion.dart';
import 'Vfrenos.dart';
import 'package:group_button/group_button.dart';
import 'Reporte.dart';

class Vafinacion extends StatefulWidget {
  ClienteControlador clientec;
  Vafinacion({
    super.key,
    required this.clientec,
  });

  @override
  State<Vafinacion> createState() => _Vafinacion();
}

class _Vafinacion extends State<Vafinacion> {
  List<String> opciones = ['✓', '✗', 'fs'];
  TextEditingController controller = TextEditingController();
  List<GroupButtonController>? controladores;

  @override
  void initState() {
    super.initState();
    controladores = List.generate(27, (index) => GroupButtonController());
    for (int i = 0; i < widget.clientec.reporte!.afinacion.length; i++) {
      if (widget.clientec.reporte!.afinacion[i] == '✓') {
        controladores![i].selectIndex(0);
      } else if (widget.clientec.reporte!.afinacion[i] == '✗') {
        controladores![i].selectIndex(1);
      } else if (widget.clientec.reporte!.afinacion[i] == 'fs') {
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
                  image: AssetImage('assets/afinacion.jpg'),
                  fit: BoxFit.fitWidth)),*/
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          widget.clientec.actualizarReporte();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Vfrenos(
                //reporte: widget.reporte,
                clientec: widget.clientec,
              ),
            ),
          );
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
              'Servico De Afinación',
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
                    title: Text('Cambio De Bujias:'),
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
                                Text('4'),
                                GroupButton(
                                    controller: controladores![0],
                                    buttons: opciones),
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('6'),
                                GroupButton(
                                    controller: controladores![1],
                                    buttons: opciones),
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('8'),
                                GroupButton(
                                  controller: controladores![2],
                                  buttons: opciones,
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('Normal'),
                                GroupButton(
                                    controller: controladores![3],
                                    buttons: opciones),
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('Platino'),
                                GroupButton(
                                    controller: controladores![4],
                                    buttons: opciones),
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('Iridium'),
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
                    title: Text('Cambio De Filtro:'),
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
                                Text('Aire'),
                                GroupButton(
                                    controller: controladores![6],
                                    buttons: opciones),
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('Aceite'),
                                GroupButton(
                                    controller: controladores![7],
                                    buttons: opciones),
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('Gasolina'),
                                GroupButton(
                                    controller: controladores![8],
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
                    title: Text('Cambio De Aceite:'),
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
                                Text('4'),
                                GroupButton(
                                    controller: controladores![9],
                                    buttons: opciones),
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('5'),
                                GroupButton(
                                    controller: controladores![10],
                                    buttons: opciones),
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('6'),
                                GroupButton(
                                    controller: controladores![11],
                                    buttons: opciones),
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('5w/30'),
                                GroupButton(
                                    controller: controladores![12],
                                    buttons: opciones),
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('10w/30'),
                                GroupButton(
                                    controller: controladores![13],
                                    buttons: opciones),
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('15w/30'),
                                GroupButton(
                                    controller: controladores![14],
                                    buttons: opciones),
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('15/40'),
                                GroupButton(
                                    controller: controladores![15],
                                    buttons: opciones),
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('20w/50'),
                                GroupButton(
                                    controller: controladores![16],
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
                    title: Text('Otros Componentes:'),
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
                                Text('Carln'),
                                GroupButton(
                                    controller: controladores![17],
                                    buttons: opciones),
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('Cables'),
                                GroupButton(
                                    controller: controladores![18],
                                    buttons: opciones),
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('8'),
                                GroupButton(
                                    controller: controladores![19],
                                    buttons: opciones),
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('Liq. Inj'),
                                GroupButton(
                                    controller: controladores![20],
                                    buttons: opciones),
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('Tapa/Dist'),
                                GroupButton(
                                    controller: controladores![21],
                                    buttons: opciones),
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('PCV'),
                                GroupButton(
                                    controller: controladores![22],
                                    buttons: opciones),
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('Rotor'),
                                GroupButton(
                                    controller: controladores![23],
                                    buttons: opciones),
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('Anticongelante'),
                                GroupButton(
                                    controller: controladores![24],
                                    buttons: opciones),
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('A. de Trans. Aut.'),
                                GroupButton(
                                    controller: controladores![25],
                                    buttons: opciones),
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('Aceite Dir. Hidrau'),
                                GroupButton(
                                    controller: controladores![26],
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
