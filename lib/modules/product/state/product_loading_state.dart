import 'product_state.dart';

class ProductLoadingState extends ProductState{

  ProductLoadingState(){
   message = 'Please wait, fetching posts....';
  }
}