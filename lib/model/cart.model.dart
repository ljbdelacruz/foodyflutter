


import 'package:foody/model/product.model.dart';

class CartModel{
  List<CartItemModel> items= [];
  CartModel();
  appendItem(ProductItemModel model, quantity){
    this.items.add(CartItemModel.setup(model, quantity));
  }

}
class CartItemModel{
  ProductItemModel product; 
  int quantity = 0;
  CartItemModel.setup(this.product, this.quantity);
}