import 'package:flutter/material.dart';
import 'presentation/screens/home_showcase_menu_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Atomic Design Showcase',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      // ---------------------------------------------
      // Para usar los componentes del sistema de diseño importa:
      // import 'package:atomic_desing_system_package/atomic_desing_system_package.dart';
      //
      // Ejemplo de uso de un botón atómico:
      // AtomButton(
      //   onPressed: () {},
      //   child: Text('Botón atómico'),
      // );
      //
      // Para ver todos los elementos y su implementación ejecuta este ejemplo,
      // verás el showcase interactivo con cada componente y plantilla.
      // ---------------------------------------------
      home: HomeShowcaseMenuList(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// ...existing code...
