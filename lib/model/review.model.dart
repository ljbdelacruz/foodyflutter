

import 'package:foody/model/category.model.dart';
import 'package:foody/model/users.model.dart';

class UserReviewModel{
  UsersModel reviewer;  
  String title;
  String comment;
  double review;
  UserReviewModel.setup(this.title, this.comment, this.review);
}

class StoreReviewModel extends UserReviewModel{
  StoreReviewCategoryModel category;
  StoreReviewModel.setup(String title, String comment, double review, this.category) : super.setup(title, comment, review);
}


class ProductReviewModel extends UserReviewModel{
  ProductReviewModel.setup(String title, String comment, double review) : super.setup(title, comment, review);
}



