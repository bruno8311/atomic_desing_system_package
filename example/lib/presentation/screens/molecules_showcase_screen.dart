import 'package:atomic_desing_system_package/atomic_desing_system_package.dart';
import 'package:flutter/material.dart';

class MoleculesShowcaseScreen extends StatelessWidget {
  const MoleculesShowcaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Moléculas'),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const Text('Botones de acción:', style: TextStyle(fontWeight: FontWeight.bold)),
          MoleculeActionButtons( 
            labels: ['Botón 1', 'Botón 2'],
            actions: [
              () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Botón 1 presionado')),
                );
              },
              () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Botón 2 presionado')),
                );
              }
            ],
            direction: Axis.horizontal,
            spacing: 20,
            alignment: MainAxisAlignment.end,
          ),
          const SizedBox(height: 24),

          const Text('Avatar con nombre:', style: TextStyle(fontWeight: FontWeight.bold)),
          MoleculeAvatarWithName(
            imageUrl: 'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
            name: 'Bruno Salazar',
            textColor: Colors.black,
          ),
          const SizedBox(height: 24),

          const Text('Caja de búsqueda:', style: TextStyle(fontWeight: FontWeight.bold)),
          MoleculeSearchBar(
            label: 'Buscar',
            controller: TextEditingController(),
            icon: Icons.search,
            onSearch: () {
             ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Buscar presionado')),
              );
            },
          ),
          const SizedBox(height: 24),

          const Text('Card con imagen:', style: TextStyle(fontWeight: FontWeight.bold)),
          MoleculeCard(
            imageUrl: 'https://images.unsplash.com/photo-1464822759023-fed622ff2c3b?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
            description: 'Este es un card de molécula con imagen, descripción y botón "Ver más".',
            onSeeMore: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Ver más presionado')),
              );
            },
          ),
          const SizedBox(height: 24),
          const Text('Card con ícono:', style: TextStyle(fontWeight: FontWeight.bold)),
          MoleculeIconCard(
            icon: Icons.star,
            title: 'Card pequeña',
            subtitle: 'Este es un card compacto con icono.',
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Card con icono presionado')),
              );
            },
          ),
          const SizedBox(height: 24),
          const Text('Input con helper text:', style: TextStyle(fontWeight: FontWeight.bold)),
          MoleculeInputWithHelperText(
            label: 'Correo electrónico',
            controller: TextEditingController(),
            helperText: 'Introduce un correo válido',
          ),
          const SizedBox(height: 24),
          const Text('Campo de Email:', style: TextStyle(fontWeight: FontWeight.bold)),
          MoleculeEmailField(controller: emailController),
          const SizedBox(height: 24),
          const Text('Campo de Contraseña:', style: TextStyle(fontWeight: FontWeight.bold)),
          MoleculePasswordField(controller: passwordController),
          const SizedBox(height: 24),

          const Text('Campo de Teléfono:', style: TextStyle(fontWeight: FontWeight.bold)),
          MoleculePhoneField(
            controller: TextEditingController(),
            label: 'Teléfono',
            helperText: 'Incluye el código de país',
          ),
          const SizedBox(height: 24),

          const Text('Campo de Fecha:', style: TextStyle(fontWeight: FontWeight.bold)),
          MoleculeDateField(
            label: 'Fecha de nacimiento',
            helperText: 'Selecciona tu fecha de nacimiento',
          ),
          const SizedBox(height: 24),

          const Text('Campo Desplegable:', style: TextStyle(fontWeight: FontWeight.bold)),
          MoleculeDropdownField<String>(
            label: 'Selecciona una opción',
            items: const [
              DropdownMenuItem(value: 'opcion1', child: Text('Opción 1')),
              DropdownMenuItem(value: 'opcion2', child: Text('Opción 2')),
              DropdownMenuItem(value: 'opcion3', child: Text('Opción 3')),
            ],
            value: null,
            onChanged: (value) {},
            helperText: 'Elige una opción del listado',
            hint: 'Opciones',
          ),
          const SizedBox(height: 24),

          const Text('Modal Simple', style: TextStyle(fontWeight: FontWeight.bold)),
          AtomButton(
            label: 'Mostrar Modal Simple',
            onPressed: () {
              MoleculeSimpleModal.show(
                context: context,
                title: 'Modal Simple',
                content: 'Este es un modal simple usando componentes atómicos.',
                buttonText: 'Cerrar',
              );
            },
          ),
          const SizedBox(height: 24),
          const Text('Modal de Confirmación', style: TextStyle(fontWeight: FontWeight.bold)),
          AtomButton(
            label: 'Mostrar Modal de Confirmación',
            onPressed: () {
              MoleculeConfirmModal.show(
                context: context,
                title: '¿Estás seguro?',
                message: 'Esta acción no se puede deshacer.',
                confirmText: 'Continuar',
                cancelText: 'Cancelar',
                onConfirm: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Confirmado')),
                  );
                },
                onCancel: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Cancelado')),
                  );
                },
              );
            },
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
