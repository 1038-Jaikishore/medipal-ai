import 'package:flutter/material.dart';
import '../models/medicine.dart';
import '../services/api_service.dart';
import '../widgets/custom_button.dart';
import 'ai_insight_screen.dart';

class AddMedicineScreen extends StatefulWidget {
  const AddMedicineScreen({Key? key}) : super(key: key);

  @override
  State<AddMedicineScreen> createState() => _AddMedicineScreenState();
}

class _AddMedicineScreenState extends State<AddMedicineScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _dosageController = TextEditingController();
  final _timeController = TextEditingController();
  bool _loading = false;

  @override
  void dispose() {
    _nameController.dispose();
    _dosageController.dispose();
    _timeController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _loading = true);
    final medicine = Medicine(
      name: _nameController.text,
      dosage: _dosageController.text,
      time: _timeController.text,
    );
    final explanation = await ApiService.explainMedicine(medicine.name);
    setState(() => _loading = false);
    if (!mounted) return;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => AiInsightScreen(
          medicine: medicine.name,
          explanation: explanation,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Medicine')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Medicine Name'),
                validator: (v) => v == null || v.isEmpty ? 'Enter name' : null,
              ),
              TextFormField(
                controller: _dosageController,
                decoration: const InputDecoration(labelText: 'Dosage'),
              ),
              TextFormField(
                controller: _timeController,
                decoration: const InputDecoration(labelText: 'Time'),
              ),
              const SizedBox(height: 20),
              _loading
                  ? const CircularProgressIndicator()
                  : CustomButton(
                      text: 'Submit',
                      onPressed: _submit,
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
