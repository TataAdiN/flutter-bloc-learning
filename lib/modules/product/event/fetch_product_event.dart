import '../../../repositories/apis/exceptions/internal_server_exception.dart';
import '../../../repositories/models/product.dart';
import '../../../repositories/product_repository.dart';
import 'product_event.dart';

class FetchProductEvent implements ProductEvent{

  Future<List<Product>> fetch() async {
    final ProductRepository apiRepository = ProductRepository();
    try {
      return await apiRepository.fetchPosts();
    } on InternalServerException {
      throw Future.error(InternalServerException);
    }
  }
}