

import 'package:foody/model/store.model.dart';
import 'package:foody/services/verifier.service.dart';
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
  String storeId;
  double productReview;
  String category;
  bool isAllowSubscription;
  String mainImage;
  bool isAvailable;

  StoreModel store;
  double rating = 0;
  int reviewerCount=0;
  List<String> thumbnails = [];
  // ProductCategory category = ProductCategory();

  ProductItemModel.json(dynamic data){
    this.id=VerifierService.instance.validateString(data["id"]);
    this.title=VerifierService.instance.validateString(data["title"]);
    this.desc=VerifierService.instance.validateString(data["description"]);
    this.price=VerifierService.instance.validateDouble(data["price"]);
    this.ownerId=VerifierService.instance.validateString(data["ownerId"]);
    this.storeId=VerifierService.instance.validateString(data["storeId"]);
    this.productReview=VerifierService.instance.validateDouble(data["productReview"]);
    this.category=VerifierService.instance.validateString(data["category"]);
    this.isAllowSubscription=VerifierService.instance.validateBool(data["isAllowSubscription"]);
    this.mainImage=VerifierService.instance.validateString(data["mainImage"]);
    this.isAvailable=VerifierService.instance.validateBool(data["isAvailable"]);
  }

  
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


class ProductParam{
  String id;
  String title;
  String desc;
  double price;
  String storeId;
  String category;
  String mainImage;
  bool isAllowSubscription;
  bool isAvailable;
  String tags;

  double latitude;
  double longitude;
  double radius;
  double review;
  String order;
  String searchText;
  int limit;

  ProductParam.newProduct(this.title, this.desc, this.price, this.storeId, this.category);
  Map<String, dynamic> toNewParam(){
    return {"title":this.title, "desc":this.desc, "price":this.price, "storeId":this.storeId, "category":this.category};
  }

  ProductParam.updateById(this.id, this.title, this.desc, this.price, this.storeId, this.category, this.mainImage, this.isAllowSubscription, this.isAvailable, this.tags);
  Map<String, dynamic> toParamUpdateById(){
    return {"title":this.title, "description":this.desc, "price":this.price, "storeId":this.storeId, "category":this.category, "mainImage":this.mainImage, "isAllowSubscription":this.isAllowSubscription, "isAvailable":this.isAvailable, "tags":this.tags};
  }

  ProductParam.updateProductLocation(this.storeId, this.longitude, this.latitude);
  Map<String, dynamic> toParamUpdateProductLocation(){
    return {"lon":this.longitude, "lat":this.latitude};
  }

  ProductParam.getByLocation(this.longitude, this.latitude, this.radius);
  ProductParam.getByLocationCategory(this.longitude, this.latitude, this.radius, this.category);

  

}








