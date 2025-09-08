
import 'package:flutter/material.dart';
import 'package:atomic_desing_system_package/atomic_desing_system_package.dart';


class PagesShowcaseScreen extends StatelessWidget {
  const PagesShowcaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Páginas'),
        centerTitle: true,
        backgroundColor: Colors.blue,
        leading: Navigator.canPop(context)
            ? IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => Navigator.of(context).maybePop(),
              )
            : null,
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.login),
            title: const Text('Login'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) =>  PageLogin()), //Navega a pagina de Login
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.dashboard),
            title: const Text('Dashboard'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const PageDashboard()), //Navega a pagina de Dashboard
              );
            },
          ),
        ],
      ),
    );
  }
}
