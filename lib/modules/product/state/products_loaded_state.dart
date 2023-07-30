import '../../../repositories/models/product.dart';
import 'product_state.dart';

class ProductsLoadedState extends ProductState{
  List<Product> products = [];

  ProductsLoadedState({required this.products});
}