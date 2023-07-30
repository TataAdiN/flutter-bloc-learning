import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/product_bloc.dart';
import 'event/fetch_product_event.dart';
import 'product_view.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    ProductBloc productBloc = ProductBloc();
    productBloc.add(FetchProductEvent());
    return MaterialApp(
      home: BlocProvider(
        create: (_) => productBloc,
        child: const ProductView(),
      ),
    );
  }
}