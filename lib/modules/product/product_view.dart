import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repositories/models/product.dart';
import 'bloc/product_bloc.dart';
import 'state/product_loading_state.dart';
import 'state/product_state.dart';
import 'state/products_loaded_state.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Products')),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductLoadingState) {
            return loadingIndicator(state.message);
          } else if (state is ProductsLoadedState) {
            return listProducts(context, state.products);
          } else {
            return Container();
          }
        },
      ),
    );
  }

  Widget listProducts(BuildContext context, List<Product> product) =>
      ListView.builder(
          itemCount: product.length,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.all(8.0),
              child: Card(
                child: Container(
                  margin: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Image.network(product[index].thumbnail),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(product[index].title,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold)),
                              Text(product[index].brand,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                          Column(
                            children: [
                              Text("\$${product[index].price}",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(product[index].description)
                    ],
                  ),
                ),
              ),
            );
          });

  Widget emptyProducts() => const Center(child: Text('Empty Products'));

  Widget loadingIndicator(String message) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(),
            const SizedBox(height: 10),
            Text(message)
          ],
        ),
      );
}
