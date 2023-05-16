import 'package:hive/hive.dart';
import 'Reporte.dart';

class ClienteControlador {
  Box<Cliente> clientes = Hive.box<Cliente>('clientes2');

  Cliente? aux;
  Reporte? reporte;

  //guardalo porfa para verlo bien que no se me corrige

  agregarCliente(nombre, telefono, direccion) {
    aux = Cliente(
      nombre: nombre.text,
      telefono: telefono.text,
      direccion: direccion.text,
      carro: Carro(
        ano: '',
        color: '',
        kil: '',
        marca: '',
        modelo: '',
        obs: '',
        placa: '',
        reportes: [],
        vin: '',
      ),
    );
  }

  //aqui pon los datos del coche que tengas
  agregarCarro(marca, modelo, ano, vin, color, kil, placa, obs) {
    aux!.carro = Carro(
      placa: placa.text,
      ano: ano.text,
      color: color.text,
      kil: kil.text,
      marca: marca.text,
      obs: obs.text,
      reportes: [],
      vin: vin.text,
      modelo: modelo.text,
    );
    clientes.add(aux!);
    print(clientes.values.last.nombre);
    print(clientes.values.last.telefono);

    print(clientes.values.last.direccion);

    print(clientes.values.last.carro.marca);
    print(clientes.values.last.carro.modelo);

    print(clientes.values.last.carro.ano);
    print(clientes.values.last.carro.vin);

    print(clientes.values.last.carro.kil);
    print(clientes.values.last.carro.color);
  }

  agregarReporte(Reporte reporte) {
    this.reporte = reporte;
    aux!.carro.reportes.add(reporte);
    clientes.putAt(clientes.length - 1, aux!);
  }

  actualizarReporte() {
    //dime si tiene algun error, y si lo tiene picale al foquito a ver que sale
    //deja lo checo, va
    aux!.carro.reportes[aux!.carro.reportes.indexOf(reporte!)] = reporte!;
    clientes.putAt(clientes.length - 1, aux!);
  }
}
