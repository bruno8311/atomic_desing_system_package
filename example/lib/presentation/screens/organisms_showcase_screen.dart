
import 'package:atomic_desing_system_package/atomic_desing_system_package.dart';
import 'package:flutter/material.dart';

class OrganismsShowcaseScreen extends StatelessWidget {
  const OrganismsShowcaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final searchController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Organismos'),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const Text('Header con buscador:', style: TextStyle(fontWeight: FontWeight.bold)),
          OrganismHeaderSearchBox(
            title: 'Valor',
            onSearch: (text) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Se buscó el valor $text')),
              );
            },
            imageUrl: 'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
            userName: 'Bruno',
            backgroundColor: const Color.fromARGB(255, 9, 102, 168),
            paddingHorizontal: 20,
            paddingVertical: 16,
            searchController: searchController,
            hintText: 'Buscar',
            onHome: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Home')),
              );
            },
            onLogout: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Logout')),
              );
            },
          ),
          const SizedBox(height: 24),
          const Text('Header base', style: TextStyle(fontWeight: FontWeight.bold)),
          OrganismHeaderWithoutSearch(
            imageUrl: 'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
            userName: 'Bruno',
            title: 'Home',
            backgroundColor: const Color.fromARGB(255, 9, 102, 168),
            paddingHorizontal: 20,
            paddingVertical: 16,
            onHome: () => ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Home')),
            ),
            onLogout: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Logout')),
              );
            },
          ),
          const SizedBox(height: 24),
          const Text('Header con icono:', style: TextStyle(fontWeight: FontWeight.bold)),
          OrganismHeaderIcon(
            imageUrl: 'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
            userName: 'Bruno',
            icon: Icons.more_vert,
            onIconPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Icono presionado')),
              );
            },
            backgroundColor: Colors.black87,
            paddingHorizontal: 20,
            paddingVertical: 16,
          ),
          const SizedBox(height: 24),
          const Text('Footer:', style: TextStyle(fontWeight: FontWeight.bold)),
          OrganismFooter(
            copyright: '© 2025 Mi Empresa. Todos los derechos reservados.',
            icons: [Icons.facebook, Icons.email],
            backgroundColor: Colors.grey.shade200,
            paddingHorizontal: 20,
            paddingVertical: 16,
            labels: ['Contacto', 'Ayuda'],
            actions: [
              () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Contacto presionado')),
                );
              },
              () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Ayuda presionado')),
                );
              },
            ],
          ),
          const SizedBox(height: 24),
          const Text('Carrusel de cards:', style: TextStyle(fontWeight: FontWeight.bold)),
          OrganismCarousel(
            title: 'Carrousel de imágenes',
            imageUrls: [
              'https://images.unsplash.com/reserve/bOvf94dPRxWu0u3QsPjF_tree.jpg?q=80&w=1176&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                'https://images.unsplash.com/photo-1682685797229-b2930538da47?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                'https://images.unsplash.com/photo-1454372182658-c712e4c5a1db?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
            ],
            descriptions: [
              'Descripción de la imagen 1',
              'Descripción de la imagen 2sdadsadsadsadsadasdasdassd',
              'Descripción de la imagen 3',
            ],
            onSeeMoreCallbacks: [
              () {},
              () {},
              () {},
            ],
          ),
          const SizedBox(height: 24),
          const Text('Formulario de Login:', style: TextStyle(fontWeight: FontWeight.bold)),
          OrganismLoginForm(
            onLogin: (email, password) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Login: $email / $password')),
              );
            },
            onForgotPassword: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Olvidaste tu contraseña')),
              );
            },
          ),
          const SizedBox(height: 24),
          const Text('Lista de cards con ícono:', style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          OrganismListIconCard(
            icons: [Icons.home, Icons.star, Icons.settings],
            titles: ['Inicio', 'Favoritos', 'Configuración'],
            subtitles: [
              'Ir a la pantalla principal',
              'Tus elementos favoritos',
              'Ajusta tus preferencias',
            ],
            onTaps: [
              () {},
              () {},
              () {},
            ],
          ),
          const SizedBox(height: 24),
          const Text('Lista de cards:', style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(
            child: OrganismListCard(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              imageUrls: [
                'https://images.unsplash.com/reserve/bOvf94dPRxWu0u3QsPjF_tree.jpg?q=80&w=1176&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                'https://images.unsplash.com/photo-1682685797229-b2930538da47?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                'https://images.unsplash.com/photo-1454372182658-c712e4c5a1db?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
              ],
              descriptions: [
                'Card 1: Descripción de ejemplo para el primer card.',
                'Card 2: Otra descripción para el segundo card.',
                'Card 3: Más contenido para el tercer card.',
              ],
              onSeeMoreCallbacks: [
                () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Ver más Card 1')),
                  );
                },
                () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Ver más Card 2')),
                  );
                },
                () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Ver más Card 3')),
                  );
                },
              ],
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
