import 'package:atomic_desing_system_package/atomic_desing_system_package.dart';
import 'package:flutter/material.dart';

class AtomsShowcaseScreen extends StatefulWidget {
  const AtomsShowcaseScreen({super.key});

  @override
  State<AtomsShowcaseScreen> createState() => _AtomsShowcaseScreenState();
}

class _AtomsShowcaseScreenState extends State<AtomsShowcaseScreen> {
  bool isChecked = false;
  int radioValue = 1;
  bool switchValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Átomos'),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const Text('Botón:', style: TextStyle(fontWeight: FontWeight.bold)),
          //Ejemplo de implementación de AtomButton
          AtomButton(label: 'Botón', textColor: Colors.white, elevation: 15, onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('AtomButton presionado')),
            );
          }),
          const SizedBox(height: 12),

          const Text('Botón Icono:', style: TextStyle(fontWeight: FontWeight.bold)),
          //Ejemplo de implementación de AtomIconButton
          AtomIconButton(icon: Icons.insert_emoticon_sharp, onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('AtomIconButton presionado')),
            );
          }),
          const SizedBox(height: 12),

          const Text('Botón texto:', style: TextStyle(fontWeight: FontWeight.bold)),
          AtomTextButton(label: 'Cargar', onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('AtomTextButton presionado')),
            );
          }),
          const SizedBox(height: 12),
          
          const Text('Label:', style: TextStyle(fontWeight: FontWeight.bold)),
          AtomLabel(text: 'Label'),
          const SizedBox(height: 12),

          const Text('Input:', style: TextStyle(fontWeight: FontWeight.bold)),
          AtomInput(controller: TextEditingController(), hintText: 'Input'),
          const SizedBox(height: 12),

          const Text('Icono:', style: TextStyle(fontWeight: FontWeight.bold)),
          AtomIcon(icon: Icons.star, size: 32, color: Colors.amber),
          const SizedBox(height: 12),

          const Text('Checkbox:', style: TextStyle(fontWeight: FontWeight.bold)),
          AtomCheckbox(
            value: isChecked,
            onChanged: (v) {
              setState(() {
                isChecked = v ?? false;
              });
            },
          ),
          const SizedBox(height: 12),

          const Text('Radio:', style: TextStyle(fontWeight: FontWeight.bold)),
          AtomRadio<int>(
            value: 1,
            groupValue: radioValue,
            onChanged: (v) {
              setState(() {
                radioValue = v ?? 1;
              });
            },
          ),
          const SizedBox(height: 12),

          const Text('Switch:', style: TextStyle(fontWeight: FontWeight.bold)),
          AtomSwitch(
            value: switchValue,
            onChanged: (v) {
              setState(() {
                switchValue = v;
              });
            },
          ),
          const SizedBox(height: 12),

          const Text('Avatar:', style: TextStyle(fontWeight: FontWeight.bold)),
          AtomAvatar(imageUrl: 'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D1', radius: 32),
          const SizedBox(height: 12),

          const Text('Texto:', style: TextStyle(fontWeight: FontWeight.bold)),
          AtomText(text: 'Texto que puedes escribir', style: const TextStyle(fontSize: 18)),
          const SizedBox(height: 12),

          const Text('Card:', style: TextStyle(fontWeight: FontWeight.bold)),
          AtomCard(child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Card Átomo'),
          )),
          const SizedBox(height: 12),
          const Text('Boton Flotante:', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 90),
        ],
      ),
      floatingActionButton: AtomFAB(
        child: const Icon(Icons.add),
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('AtomFAB presionado')),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}