import 'package:flutter/material.dart';

class DetailView extends StatelessWidget {
  const DetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Detail')),
        body: Container(height: 200, color: Colors.red));
  }
}
