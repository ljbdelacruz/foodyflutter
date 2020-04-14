


import 'package:foody/model/product.model.dart';
import 'package:foody/model/review.model.dart';
import 'package:foody/model/users.model.dart';

class StoreModel{
  String name;
  double storeReview;
  int reviewerCount;
  String profileImage;
  UsersModel owner;
  List<StoreReviewModel> reviews = [];
  ProductModel products = ProductModel();
  StoreModel.dum1(){
    this.name = "Big Bang Store";
    this.storeReview = 3.0;
    this.reviewerCount = 10;
    this.profileImage="assets/images/home.png";
    this.owner=UsersModel.dum1();
  }
  
}