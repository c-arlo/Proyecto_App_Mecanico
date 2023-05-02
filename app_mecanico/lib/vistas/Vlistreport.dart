import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

List<String> fecha = ['Ultimo mes','Ultimos 3 meses','Ultimo año','Ultimos 3 años'];
List<String> marca = ['Carro1','Carro2','Carro3','Carro4'];


class Vlistreport extends StatefulWidget {
  const Vlistreport({
    super.key,
  });

  @override
  State<Vlistreport> createState() => _VlistreportState();
}

class _VlistreportState extends State<Vlistreport> {
  void _estado() {}

  String valor1 = fecha.first;
  String valor2 = marca.first;

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: Row(
                children: [
                  const Icon(Icons.list),
                  const Text('Reportes'),
                ],
              ),
              style: ElevatedButton.styleFrom(
                shape: StadiumBorder(),
                backgroundColor: Colors.cyan,
              ),
            ),
            ElevatedButton(
                onPressed: () {},
                child: Row(
                  children: [
                    const Icon(Icons.add_box),
                    const Text('Reportes'),
                  ],
                )),
            Text('data'),
            Text('data'),
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
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
                    title: Text('Filtros de Busqueda'),
                    trailing: Icon(Icons.filter_alt),
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Fecha:  ',

                              ),
                              DropdownButton(
                                value: valor1,
                                items: fecha
                                    .map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                onChanged: (String? value) {
                                  setState(() {
                                    valor1 = value!;
                                  });
                                },
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Marca:  ',

                              ),
                              DropdownButton(
                                value: valor2,
                                items: marca
                                    .map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                onChanged: (String? value) {
                                  setState(() {
                                    valor2 = value!;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
