import 'package:flutter/material.dart';

class PantallaClima extends StatefulWidget {
  final String? ciudad;
  final double? temperatura;
  final double? sensacionT;
  final String? descripcion;
  final int? humedad;
  final double? viento;

  PantallaClima({
    this.ciudad,
    this.temperatura,
    this.sensacionT,
    this.descripcion,
    this.humedad,
    this.viento,
  });

  @override
  State<PantallaClima> createState() => _PantallaClimaState();
}

class _PantallaClimaState extends State<PantallaClima> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        decoration: BoxDecoration(
          color: Colors.grey[800],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Clima en ${widget.ciudad ?? ''}",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            _buildInfoRow("Temperatura", widget.temperatura != null ? "${widget.temperatura!.toStringAsFixed(1)}°C" : "-"),
            _buildInfoRow("Sensación térmica", widget.sensacionT != null ? "${widget.sensacionT!.toStringAsFixed(1)}°C" : "-"),
            _buildInfoRow("Descripción", widget.descripcion ?? "-"),
            _buildInfoRow("Humedad", widget.humedad != null ? "${widget.humedad}%" : "-"),
            _buildInfoRow("Viento", widget.viento != null ? "${widget.viento} m/s" : "-"),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
