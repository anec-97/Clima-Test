import 'package:flutter/material.dart';
import 'pantalla_inicio.dart';

void main() => runApp(TestClima());

class TestClima extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue, // Cambia el color primario de la aplicación
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.blue, // Usar el mismo color para el esquema de colores
        ).copyWith(
          secondary: Colors.green, // Cambia el color secundario (color acentuado)
        ),
        fontFamily: 'Roboto', // Cambia la fuente de texto predeterminada
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.red, // Cambia el color de fondo de la barra de navegación
          elevation: 0, // Quita la sombra de la barra de navegación
        ),
        
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.orange, // Cambia el color de los botones
          textTheme: ButtonTextTheme.primary, // Usa el estilo de texto primario en los botones
        ),
      ),
      home: PantallaInicio(),
    );
  }
}
