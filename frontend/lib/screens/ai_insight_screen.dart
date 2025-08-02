import 'package:flutter/material.dart';

class AiInsightScreen extends StatelessWidget {
  final String medicine;
  final String explanation;

  const AiInsightScreen({Key? key, required this.medicine, required this.explanation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AI Insight')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              medicine,
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(height: 12),
            Text(explanation),
          ],
        ),
      ),
    );
  }
}
