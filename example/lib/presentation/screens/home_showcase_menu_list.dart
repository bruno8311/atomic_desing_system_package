import 'package:flutter/material.dart';
import 'atoms_showcase_screen.dart';
import 'molecules_showcase_screen.dart';
import 'organisms_showcase_screen.dart';
import 'templates_showcase_screen.dart';
import 'pages_showcase_screen.dart';

class HomeShowcaseMenuList extends StatelessWidget {
  const HomeShowcaseMenuList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Atomic Design Showcase'),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.blur_on, color: Colors.deepPurple),
            title: const Text('Átomos'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const AtomsShowcaseScreen(),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.bubble_chart, color: Colors.teal),
            title: const Text('Moléculas'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const MoleculesShowcaseScreen(),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.widgets, color: Colors.orange),
            title: const Text('Organismos'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const OrganismsShowcaseScreen(),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.view_module, color: Colors.blue),
            title: const Text('Plantillas'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const TemplatesShowcaseScreen(),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.web, color: Colors.green),
            title: const Text('Páginas'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const PagesShowcaseScreen(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
