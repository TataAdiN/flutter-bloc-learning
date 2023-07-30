import 'product_state.dart';

class ProductErrorState extends ProductState{

  ProductErrorState(String message){
    this.message = '{$message}, please try again later....';
  }
}