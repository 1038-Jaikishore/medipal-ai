import 'package:flutter/material.dart';
import '../widgets/custom_button.dart';
import 'add_medicine_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('MediPal AI')),
      body: Center(
        child: CustomButton(
          text: 'Add Medicine',
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const AddMedicineScreen(),
              ),
            );
          },
        ),
      ),
    );
  }
}
