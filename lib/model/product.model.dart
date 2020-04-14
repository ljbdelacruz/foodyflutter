

import 'package:foody/model/store.model.dart';

import 'category.model.dart';

class ProductModel{
  List<ProductItemModel> items = [];
  ProductModel();
  ProductModel.dum1(){
    this.items.add(ProductItemModel.dum1());
    this.items.add(ProductItemModel.dum2());
  }
}

class ProductItemModel{
  String id;
  String title;
  String desc;
  double price;
  String ownerId;
  StoreModel store;
  String mainImage;
  double rating = 0;
  int reviewerCount=0;
  List<String> thumbnails = [];
  ProductCategory category = ProductCategory();


  ProductItemModel.dum1(){
    this.id="1ee";
    this.title = "Spagetti 1";
    this.desc="Awesome Spags tons of spices";
    this.price=20.0;
    this.ownerId="";
    this.store=StoreModel.dum1();
    this.mainImage="assets/images/sample_1.png";
    this.thumbnails=["assets/images/sample_1.png", "assets/images/sample_1.png"];
    this.rating = 4;
    this.reviewerCount=4;
  }
  ProductItemModel.dum2(){
    this.id="2ee";
    this.title = "Queens Burger";
    this.desc="Made from starling city";
    this.price=49.50;
    this.ownerId="";
    this.store=StoreModel.dum1();
    this.mainImage="assets/images/sample_1.png";
    this.thumbnails=["assets/images/sample_1.png", "assets/images/sample_1.png"];
    this.rating = 4.5;
    this.reviewerCount=1000;    
  }

}



