import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'pantalla_clima.dart';

class PantallaInicio extends StatefulWidget {
  @override
  State<PantallaInicio> createState() => _PantallaInicioState();
}

class _PantallaInicioState extends State<PantallaInicio> {
  double latitud = 0.0;
  double longitud = 0.0;

  @override
  void initState() {
    super.initState();
    getUbicacion();
  }

  void getUbicacion() async {
    try {
      LocationPermission permiso1 = await Geolocator.checkPermission();
      LocationPermission permiso2 = await Geolocator.requestPermission();
      Position posicion = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      latitud = posicion.latitude;
      longitud = posicion.longitude;
      getDatos();
    } catch (e) {
      print(e);
    }
  }

  void getDatos() async {
    const apiKey = '638ab06bf7723f4d9b4826177939b6c2';
    var response = await http.get(
      Uri.parse(
          "https://api.openweathermap.org/data/2.5/weather?lat=28.6348276&lon=-106.1463432&appid=$apiKey&units=metric"),
    );
    if (response.statusCode == 200) {
      String data = response.body;
      String ciudad = jsonDecode(data)['name'];
      double temperatura = jsonDecode(data)['main']['temp'];
      double sensacionT = jsonDecode(data)['main']['feels_like'];
      String descripcion = jsonDecode(data)['weather'][0]['description'];
      int humedad = jsonDecode(data)['main']['humidity'];
      double viento = jsonDecode(data)['wind']['speed'];
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PantallaClima(
            ciudad: ciudad,
            temperatura: temperatura,
            sensacionT: sensacionT,
            descripcion: descripcion,
            humedad: humedad,
            viento: viento,
          ),
        ),
      );
    } else {
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitFadingCircle(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}