import 'package:flutter/material.dart';
import 'ClienteControlador.dart';
import 'Vafinacion.dart';
//import 'producto.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Vdireccion.dart';
import 'Vfrenos.dart';
import 'Reporte.dart';
import 'package:group_button/group_button.dart';
import 'reg_vehiculo.dart';

class registrarcl extends StatefulWidget {
  const registrarcl({
    super.key,
  });

  @override
  State<registrarcl> createState() => _registrarclState();
}

class _registrarclState extends State<registrarcl> {
  TextEditingController? nombre = TextEditingController();
  TextEditingController? telefono = TextEditingController();
  TextEditingController? domicilio = TextEditingController();

  ClienteControlador clientec = ClienteControlador();

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
                image: AssetImage('assets/cliente.png'), fit: BoxFit.fitWidth),*/
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          clientec.agregarCliente(nombre, telefono, domicilio);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => registrarve(clientec: clientec),
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
              'Registro de Cliente',
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
                            Text('Nombre del cliente: '),
                            Expanded(
                              child: TextField(
                                decoration: const InputDecoration(
                                  label: Text(''),
                                ),
                                controller: nombre,
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text('telefono: '),
                            Expanded(
                              child: TextField(
                                decoration:
                                    const InputDecoration(label: Text('')),
                                controller: telefono,
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text('Domicilio: '),
                            Expanded(
                              child: TextField(
                                decoration:
                                    const InputDecoration(label: Text(' ')),
                                controller: domicilio,
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 20),
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
