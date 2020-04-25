


import 'cart.model.dart';

class ToPayListModel{
  List<ToPayModel> items = [];
  ToPayListModel();
}

class ToPayModel{
  String desc = "";
  double totalAmount = 0;
  CartModel items=CartModel();
  ToPayModel();
}