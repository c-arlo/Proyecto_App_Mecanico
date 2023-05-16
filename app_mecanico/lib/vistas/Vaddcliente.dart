import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';

  List<String> estados = ['Aguascalientes','Baja California','Baja California Sur',
  'Campeche','Chiapas','Chihuahua','Coahuila','Colima','CDMX','Estado de México',
  'Guanajuato','Guerrero','Hidalgo','Jalisco','Michoacán','Morelos','Nayarit','Nuevo León',
  'Oaxaca','Puebla','Querétaro','Quintana Roo','San Luis Potosí','Sinaloa','Sonora','Tabasco',
  'Tamaulipas','Tlaxcala','Veracruz','Yucatán','Zacatecas'
  ];

class Vaddcliente extends StatefulWidget {
  const Vaddcliente({
    super.key,
  });

  @override
  State<Vaddcliente> createState() => _VaddclienteState();
}

class _VaddclienteState extends State<Vaddcliente> {
  final TextEditingController nombreCtrl = TextEditingController();
  final TextEditingController mapellidoCtrl = TextEditingController();
  final TextEditingController papellidoCtrl = TextEditingController();
  final TextEditingController telCtrl = TextEditingController();
  final TextEditingController calleCtrl = TextEditingController();
  var box = Hive.box('Clientes');
  String vdef = estados.first;

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
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 20,),
            Text('Registro de Cliente',
                textAlign: TextAlign.start,
                style: GoogleFonts.rubik(
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                  fontSize: 25,
                )),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                margin: EdgeInsets.all(15),
                padding: EdgeInsets.symmetric(vertical:30,horizontal:20),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('Datos del Cliente',style: GoogleFonts.rubik(fontSize: 18,),textAlign: TextAlign.left,),
                      TextField(
                        style: GoogleFonts.rubik(fontSize: 18),
                        controller: nombreCtrl,
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Nombre',
                        ),
                      ),
                      TextField(
                        style: GoogleFonts.rubik(fontSize: 18),
                        controller: papellidoCtrl,
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Apellido Paterno',
                        ),
                      ),
                      TextField(
                        style: GoogleFonts.rubik(fontSize: 18),
                        controller: mapellidoCtrl,
                        decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: 'Apellido Materno',
                            ),
                      ),
                      TextField(
                        style: GoogleFonts.rubik(fontSize: 18),
                        controller: telCtrl,
                        keyboardType: TextInputType.phone,
                        decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: 'Núm. de Telefono',
                            ),
                      ),
                      SizedBox(height: 30,),
                      Text('Dirección',style: GoogleFonts.rubik(fontSize: 18,),textAlign: TextAlign.left,),
                      TextField(
                        style: GoogleFonts.rubik(fontSize: 18),
                        controller: calleCtrl,
                        decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: 'Calle',
                            ),
                      ),
                      SizedBox(height: 30,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Estado:',style: GoogleFonts.rubik(fontSize: 18)),
                          DropdownButton(
                            icon: Icon(Icons.expand_more),
                            isDense: true,
                            menuMaxHeight: 200,
                            value: vdef,
                            items: estados
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value,
                                    style: GoogleFonts.rubik(fontSize: 18)),
                              );
                            }).toList(),
                            onChanged: (String? value) {
                              setState(() {
                                vdef = value!;
                              });
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 30,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Container(child: const Text('Cancelar'),
                            padding: EdgeInsets.all(15),),
                            style: ElevatedButton.styleFrom(
                                shape: StadiumBorder(),
                                foregroundColor: Colors.white,
                                textStyle: GoogleFonts.rubik(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                                backgroundColor: Color(0xFFD3A518)),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Map<String,dynamic> m = {
                                'nombre':nombreCtrl.text,
                                'appat':papellidoCtrl.text,
                                'apmat':mapellidoCtrl.text,
                                'tel':telCtrl.text,
                                'calle':calleCtrl.text,
                                'estado':vdef,
                              };
                              box.add(m);
                              showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: Row(
                              children: [
                                Icon(
                                  Icons.check_circle,
                                  color: Colors.green
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text('Confirmacion'),
                              ]),
                            content:
                                const Text('¡Cliente Registrado!'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text('OK'),
                              ),
                            ],
                          ),
                        ).then((value) => Navigator.pop(context));
                            },
                            child: Container(child: const Text('Guardar'),
                            padding: EdgeInsets.all(15),),
                            style: ElevatedButton.styleFrom(
                                shape: StadiumBorder(),
                                foregroundColor: Colors.white,
                                textStyle: GoogleFonts.rubik(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                                backgroundColor: Colors.cyan),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
