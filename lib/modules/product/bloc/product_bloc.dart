import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../repositories/apis/exceptions/internal_server_exception.dart';
import '../../../repositories/models/product.dart';
import '../event/fetch_product_event.dart';
import '../event/product_event.dart';
import '../state/product_error_state.dart';
import '../state/product_loading_state.dart';
import '../state/product_state.dart';
import '../state/products_loaded_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductLoadingState()) {
    on<FetchProductEvent>(_fetchProduct);
  }

  _fetchProduct(
    FetchProductEvent event,
    Emitter<ProductState> emit,
  ) async {
    try {
      List<Product> products = await event.fetch();
      emit(ProductsLoadedState(products: products));
    } on InternalServerException catch (exception) {
      emit(ProductErrorState(exception.message));
    }
  }
}
