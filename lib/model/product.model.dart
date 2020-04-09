

import 'package:foody/model/store.model.dart';

class ProductModel{
  List<ProductItemModel> items = [];
  ProductModel.dum1(){
    this.items.add(ProductItemModel.dum1());
    this.items.add(ProductItemModel.dum1());
    this.items.add(ProductItemModel.dum1());    
    this.items.add(ProductItemModel.dum1());
    this.items.add(ProductItemModel.dum1());
    this.items.add(ProductItemModel.dum1());    
    this.items.add(ProductItemModel.dum1());
    this.items.add(ProductItemModel.dum1());
    this.items.add(ProductItemModel.dum1());    
    this.items.add(ProductItemModel.dum1());
    this.items.add(ProductItemModel.dum1());
    this.items.add(ProductItemModel.dum1());    
    this.items.add(ProductItemModel.dum1());
    this.items.add(ProductItemModel.dum1());
    this.items.add(ProductItemModel.dum1());                    

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

  ProductItemModel.dum1(){
    this.id="1ee";
    this.title = "Spagetti 1";
    this.desc="Awesome Spags tons of spices";
    this.price=20.0;
    this.ownerId="";
    this.store=StoreModel.dum1();
    this.mainImage="assets/images/home.png"; 
  }


}

