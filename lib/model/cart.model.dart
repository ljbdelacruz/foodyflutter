


import 'package:foody/model/product.model.dart';

class CartModel{
  List<CartItemModel> items= [];
}
class CartItemModel{
  ProductItemModel product; 
  int quantity = 0;
  CartItemModel.setup(this.product, this.quantity);
}