
## Atomic Desing System Package

Paquete de sistema de diseño para Flutter basado en los principios de Atomic Design.

## Getting started
fake_store_api_package: 2

## Usage

1. Agrega la dependencia en tu `pubspec.yaml`:
```yaml
dependencies:
	atomic_desing_system_package:
		git:
			url: https://github.com/bruno8311/atomic_desing_system_package.git
```

2. Importa los componentes que necesites:
```dart
import 'package:atomic_desing_system_package/atomic_desing_system_package.dart';
```

3. Utiliza los componentes en tu app:
```dart
AtomButton(
	onPressed: () {},
	child: Text('Botón atómico'),
);
```
Se puede ver el uso correcto en la pestaña del example.

## Descripción

Este paquete implementa un sistema de diseño completo estructurado en cinco niveles: átomos, moléculas, organismos, plantillas y páginas. Cada componente es fácilmente reutilizable y está pensado para acelerar el desarrollo de interfaces consistentes y mantenibles en Flutter.

## Organización del sistema de diseño

- **Átomos:** Elementos básicos como botones, inputs, iconos, imágenes, textos, avatares, etc. (ubicados en `lib/presentation/atoms/`).
- **Moléculas:** Combinaciones simples de átomos, como campos de formulario, tarjetas, barras de búsqueda, modales, etc. (`lib/presentation/molecules/`).
- **Organismos:** Componentes complejos y autosuficientes, como formularios completos, headers, footers, listas y carruseles. (`lib/presentation/organisms/`).
- **Plantillas:** Estructuras de página reutilizables, como dashboards, páginas de login y resultados de búsqueda. (`lib/presentation/templates/`).
- **Páginas:** Ejemplos de páginas completas usando los componentes anteriores. (`lib/presentation/pages/`).

## Ejemplo tipo Showcase

El paquete incluye un proyecto de ejemplo en la carpeta `example/` que funciona como un showcase interactivo. Este ejemplo muestra el funcionamiento de cada componente y tiene pantallas dedicadas para cada nivel de Atomic Design, facilitando la exploración y pruebas de los componentes.


## Ejecutar el ejemplo

1. Clona el repositorio:
```bash
git clone https://github.com/bruno8311/atomic_desing_system_package.git
```
2. Entra a la carpeta de ejemplo:
```bash
cd atomic_desing_system_package/example
```
3. Instala dependencias y ejecuta:
```bash
flutter pub get
flutter run
```

## Descripción de los Templates

- **TemplateDashboardPage:**  
	Plantilla de dashboard personalizable que integra header con información de usuario, carruseles de imágenes y descripciones, tarjetas de acceso rápido y un footer configurable. Ideal para mostrar información resumida y accesos directos en una sola pantalla.

- **TemplateLoginPage:**  
	Plantilla de página de inicio de sesión con campos para email y contraseña, opción de recuperar contraseña, título, subtítulo y posibilidad de mostrar flecha de retroceso. Facilita la implementación de pantallas de autenticación consistentes.

- **SearchResultsPage:**  
	Plantilla para mostrar resultados de búsqueda, con header configurable, botones de navegación, tarjetas de resultados con imágenes y descripciones, y footer personalizable. Perfecta para aplicaciones que requieren mostrar listas de resultados filtrados o buscados.

