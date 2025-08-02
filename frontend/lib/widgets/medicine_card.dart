import 'package:flutter/material.dart';
import '../models/medicine.dart';

class MedicineCard extends StatelessWidget {
  final Medicine medicine;

  const MedicineCard({Key? key, required this.medicine}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(medicine.name),
        subtitle: Text('Dosage: ${medicine.dosage}\nTime: ${medicine.time}'),
      ),
    );
  }
}
