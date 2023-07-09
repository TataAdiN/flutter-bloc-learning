import 'package:bloc_learning/modules/detail/detail_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: DetailView(),
    );
  }
}