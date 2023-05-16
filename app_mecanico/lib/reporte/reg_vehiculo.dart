import 'package:flutter/material.dart';
import 'ClienteControlador.dart';
import 'Vafinacion.dart';
//import 'producto.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Vdireccion.dart';
import 'Vfrenos.dart';
import 'Reporte.dart';
//import 'package:group_button/group_button.dart';

class registrarve extends StatefulWidget {
  ClienteControlador clientec;
  registrarve({
    super.key,
    required this.clientec,
  });

  @override
  State<registrarve> createState() => _registrarveState();
}

class _registrarveState extends State<registrarve> {
  TextEditingController? marca = TextEditingController();
  TextEditingController? modelo = TextEditingController();
  TextEditingController? ano = TextEditingController();
  TextEditingController? vin = TextEditingController();
  TextEditingController? color = TextEditingController();
  TextEditingController? kil = TextEditingController();
  TextEditingController? placa = TextEditingController();
  TextEditingController? obs = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 169, 170, 171),
      appBar: AppBar(
        automaticallyImplyLeading: true,
        toolbarHeight: 100,
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            /*image: DecorationImage(
                image: AssetImage('assets/registrocar.jpg'),
                fit: BoxFit.fitWidth),*/
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          widget.clientec.agregarCarro(
            marca,
            modelo,
            ano,
            vin,
            color,
            kil,
            placa,
            obs,
          ); 
          Reporte aux = Reporte(
            afinacion: List.generate(27, (index) => ''),
            frenos: List.generate(34, (index) => ''),
            direccion: List.generate(10, (index) => ''),
            suspencion: List.generate(22, (index) => ''),
            motor: List.generate(27, (index) => ''),
            enfriamiento: List.generate(18, (index) => ''),
          );
          widget.clientec.agregarReporte(aux);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Vafinacion(
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
              'Registro de Vehiculo',
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
                            Text('Marca: '),
                            Expanded(
                              child: TextField(
                                decoration:
                                    const InputDecoration(label: Text('')),
                                controller: marca,
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text('Modelo: '),
                            Expanded(
                              child: TextField(
                                decoration:
                                    const InputDecoration(label: Text('')),
                                controller: modelo,
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text('Año: '),
                            Expanded(
                              child: TextField(
                                decoration:
                                    const InputDecoration(label: Text('')),
                                controller: ano,
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text('Vin: '),
                            Expanded(
                              child: TextField(
                                decoration:
                                    const InputDecoration(label: Text('')),
                                controller: vin,
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text('Color: '),
                            Expanded(
                              child: TextField(
                                decoration:
                                    const InputDecoration(label: Text('')),
                                controller: color,
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text('Kilometros/Millas: '),
                            Expanded(
                              child: TextField(
                                decoration:
                                    const InputDecoration(label: Text('')),
                                controller: kil,
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text('Placas: '),
                            Expanded(
                              child: TextField(
                                decoration:
                                    const InputDecoration(label: Text('')),
                                controller: placa,
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 20),
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
                                title: Text('Observaciones: '),
                                trailing: Icon(Icons.arrow_drop_down),
                                children: [
                                  Container(
                                    padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                                    decoration: BoxDecoration(
                                      color: Color.fromRGBO(3, 210, 255, 1),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                    ),
                                    child: Column(
                                      children: [
                                        TextField(
                                          controller: obs,
                                          maxLines: null,
                                          decoration: InputDecoration(
                                              hintText: 'Escribe aqui...'),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
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
