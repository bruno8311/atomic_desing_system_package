
import 'package:atomic_desing_system_package/atomic_desing_system_package.dart';
import 'package:flutter/material.dart';

class TemplatesShowcaseScreen extends StatelessWidget {
  const TemplatesShowcaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Strings Reutilizables
    const userName = 'Bruno';
    const userImageUrl = 'https://scontent.fcix3-1.fna.fbcdn.net/v/t1.6435-9/199385759_345470910277839_3988273979229903886_n.jpg?_nc_cat=1&ccb=1-7&_nc_sid=6ee11a&_nc_eui2=AeH7nnrp8wBNTp6_IgBDlx4c_R1YrUnrs9b9HVitSeuz1qjz6pU0reOGKOt2lqfHuG3Z2vIJBoKwfwvTfoHsur02&_nc_ohc=SeLkX0AzpJ8Q7kNvwE5gnnO&_nc_oc=AdnaTHWop5iCzio4Pc5MmGZ0Hc9LMDWp3Ius52QP2VY8dxI0FxwgNmZKgn-ZHiEsdJQ&_nc_zt=23&_nc_ht=scontent.fcix3-1.fna&_nc_gid=_l-2szaZj-DvM7Mp2tQEgA&oh=00_AfaUKaW7SAHaATjQoGViPoXSmKJAwaJYcVpNrhHSp-jVlA&oe=68E587CF';
    const searchTitle = 'Busqueda';
    const detailTitle = 'White Gold Plated Princess';
    const detailImageUrl = 'https://images.unsplash.com/photo-1682685797229-b2930538da47?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D';
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Plantillas'),
          bottom: const TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white70,
            indicatorColor: Colors.white,
            tabs: [
              Tab(text: 'Login'),
              Tab(text: 'Dashboard'),
              Tab(text: 'Lista'),
              Tab(text: 'Detalle'),
              Tab(text: 'Contacto'),
              Tab(text: 'Base'),
            ],
          ),
          backgroundColor: Colors.blue,
        ),
        body: TabBarView(
          children: [
            //Plantilla de Login
            TemplateLoginPage(
              title: 'Bienvenido',
              subtitle: 'Inicia sesión para continuar',
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
            //Plantilla de Dashboard (Pantalla principal)
            TemplateDashboardPage(
              headerUserName: userName,
              headerUserImageUrl: userImageUrl,
              headerHintText: 'Buscar',
              headerTitle: 'Dashboard',
              headerOnSearch: (text) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Se buscó el valor $text')),
                );
              },
              headerOnLogout: () => {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Logout')),
                )
              },
              headerOnHome: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Home')),
                );
              },
              headerUserNameFontSize: 14,
              headerAvatarRadius: 20,
              bodyCardHeaderTitle: 'Favoritos',
              bodyCardIcons: const [
                Icons.star,
                Icons.shopping_cart,
              ],
              bodyCardTitles: const [
                'Favoritos',
                'Carrito',
              ],
              bodyCardSubtitles: const [
                'Tus elementos favoritos',
                'Tus productos en carrito',
              ],
              bodyCardOnTaps: [
                () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Favoritos')),
                  );
                },
                () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Carrito')),
                  );
                },
              ],
              bodyCarouselsTitles: [
                'Productos Destacados',
                'Ultimos Pedidos',
              ],
              bodyCarouselsImageUrls: [
                [
                  'https://images.unsplash.com/reserve/bOvf94dPRxWu0u3QsPjF_tree.jpg?q=80&w=1176&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                  'https://images.unsplash.com/photo-1682685797229-b2930538da47?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                ],
                [
                  'https://images.unsplash.com/photo-1454372182658-c712e4c5a1db?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                  'https://images.unsplash.com/photo-1682685797229-b2930538da47?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                ],
              ],
              bodyCarouselsDescriptions: [
                [
                  'Descripcion de card 1',
                  'Descripcion de card 2',
                ],
                [
                  'Promo especial 1',
                  'Promo especial 2',
                ],
              ],
              bodyCarouselsOnSeeMore: [
                [
                  () {},
                  () {},
                ],
                [
                  () {},
                  () {},
                ],
              ],
              footerIcons: const [
                Icons.facebook,
                Icons.email,
              ],
              footerLabels: const ['Términos', 'Privacidad'],
              footerActions: [
                () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Términos')),
                  );
                },
                () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Privacidad')),
                  );
                },
              ],
            ),
            //Plantilla de Búsqueda
            TemplateListCarts(
              headerUserName: userName,
              headerUserImageUrl: userImageUrl,
              headerTitle: searchTitle,
              
              headerOnSearch: (text) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Se buscó el valor $text')),
                );
              },
              headerOnLogout: () => {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Logout')),
                )
              },
              headerOnHome: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Home')),
                );
              },
              bodyCardImageUrls: [
                'https://images.unsplash.com/reserve/bOvf94dPRxWu0u3QsPjF_tree.jpg?q=80&w=1176&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                'https://images.unsplash.com/photo-1682685797229-b2930538da47?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
              ],
              bodyCardDescriptions: [
                'Elemento 1.',
                'Elemento 2.',
              ],
              bodyCardOnSeeMore: [
                () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Ver más de card 1')),
                  );
                },
                () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Ver más de card 2')),
                  );
                },
              ],
              footerIcons: const [
                Icons.facebook,
                Icons.email,
              ],
              footerLabels: const ['Términos', 'Privacidad'],
              footerActions: [
                () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Términos')),
                  );
                },
                () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Privacidad')),
                  );
                },
              ],
              footerBackgroundColor: Color(0xFFEEEEEE),
            ),
            //Plantilla de detalle
            TemplateDetailPage(
              headerUserImageUrl: userImageUrl,
              headerUserName: userName,
              headerTitle: detailTitle,
              headerShowBackArrow: true,
              headerOnLogout: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Logout')),
                );
              },
              headerOnHome: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Home')),
                );
              },
              productImageUrl: detailImageUrl,
              productTitle: detailTitle,
              productPrice: 'S/ 9.99',
              productCategory: 'jewelery',
              productDescription: 'Classic Created Wedding Engagement Solitaire Diamond Promise Ring for Her. Gifts to spoil your love more for Engagement, Wedding, Anniversary, Valentine\'s Day...',
              buttonLabel: 'Añadir',
              onButtonPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Agregado al carrito')),
                );
              },
              footerIcons: const [
                Icons.facebook,
                Icons.email,
              ],
              footerLabels: const ['Términos', 'Privacidad'],
              footerActions: [
                () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Términos')),
                  );
                },
                () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Privacidad')),
                  );
                },
              ],
              footerBackgroundColor: Color(0xFFEEEEEE),
            ),
            //TemplateContactPage
            TemplateContactPage(
              headerUserImageUrl: userImageUrl,
              headerUserName: userName,
              headerTitle: detailTitle,
              headerShowBackArrow: true,
              headerOnLogout: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Logout')),
                );
              },
              headerOnHome: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Home')),
                );
              },
              descriptiveTitle: 'Titulo',
              descriptiveSubtitle:  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec euismod, nisl eget consectetur sagittis, nisl nunc.',
              descriptiveTextFieldHint: 'Escribe aquí...',
              descriptiveButtonText: 'Enviar',
              descriptiveButtonDependsOnText: true,
              descriptiveOnButtonPressed: (text) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Texto enviado: $text')),
                );
              },
              footerIcons: const [
                Icons.facebook,
                Icons.email,
              ],
              footerLabels: const ['Términos', 'Privacidad'],
              footerActions: [
                () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Términos')),
                  );
                },
                () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Privacidad')),
                  );
                },
              ],
              footerBackgroundColor: Color(0xFFEEEEEE),
            ),
            TemplateBasePage(
              header: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.amber[200],
                  border: Border.all(color: Colors.black, width: 2),
                ),
                child: const Text('Header de ejemplo', style: TextStyle(fontSize: 16)),
              ),
              body: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black, width: 2),
                ),
                child: const Center(child: Text('Contenido del cuerpo')),
              ),
              footer: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.lightBlueAccent,
                  border: Border.all(color: Colors.black, width: 2),
                ),
                child: const Text('Footer de ejemplo', style: TextStyle(fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
