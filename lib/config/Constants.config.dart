import 'package:flutter/material.dart';
import 'package:foody/model/cart.model.dart';
import 'package:foody/model/foodcategory.model.dart';
import 'package:foody/model/product.model.dart';
import 'package:foody/services/facebook.service.dart';

class Constants{
  static Constants instance=Constants();
  Color themeColor=Colors.white;
  FacebookUserInfo fbLoginInfo;
  String currency="";
  int currencyCode=0;
  ProductModel products;
  FoodCategoryVM fcategory=FoodCategoryVM();
  CartModel cart;

  Constants(){
    this.cart=CartModel();
    this.fcategory.setupDummyData();
    this.products=ProductModel.dum1();
  }
  setupProductCategory(){

  }
}

