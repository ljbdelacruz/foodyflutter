


import 'package:foody/services/verifier.service.dart';

class StoreReviewCategoryModel{
  String id;
  String name;
}

class CategoryModel{
  String id;
  String description;
  String value;
  String categoryType;
  CategoryModel();
  CategoryModel.json(dynamic data){
    this.id=VerifierService.instance.validateString(data["id"]);
    this.description=VerifierService.instance.validateString(data["description"]);
    this.value=VerifierService.instance.validateString(data["value"]);
    this.categoryType=VerifierService.instance.validateString(data["categoryType"]);
  }
}



class ProductCategory{
  String id="";
  String title="";
  String desc="";
  String mainImage="";
  ProductCategory();

}


class CategoryParam{
  String desc;
  String value;
  String categoryType;
  CategoryParam.newCategory(this.desc, this.value, this.categoryType);
  Map<String, dynamic> toNewParam(){
    return {"desc":this.desc, "value":this.value, "categoryType":this.categoryType};
  }



}

