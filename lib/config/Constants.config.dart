import 'package:foody/services/facebook.service.dart';

class Constants{
  static Constants instance=Constants();

  FacebookUserInfo fbLoginInfo;
  String currency="";
  int currencyCode=0;
  ProductsListVM products=ProductsListVM();
  FoodCategoryVM fcategory=FoodCategoryVM();
  Constants(){
    this.fcategory.setupDummyData();
    this.products.setupDummyData();
  }
  setupProductCategory(){

  }
}

class FoodCategoryVM{
  List<FoodCategory> fcategory=[];

  setupDummyData(){
    if(fcategory.length<=0){
      fcategory.add(FoodCategory("assets/images/elect.png", "Italian", "Spaghetti, etc"));
      fcategory.add(FoodCategory("assets/images/elect.png", "Japanese", "Sushi, etc"));    
    }    
  }

}


class FoodCategory{
  String image;
  String title;
  String desc;
  FoodCategory(this.image, this.title, this.desc);
}


class ProductsListVM{
  List<ProductItems> products=[];

  List<ProductItems> searchItem(String text){
    return this.products.where((item){ return item.title.contains(text); });
  }
  setupDummyData(){
    products.add(ProductItems("1ee", "Carbonara Spaghetti", "Super Yummy", 200));
    products.add(ProductItems("2ee", "Spaghetti", "Super Yummy", 100));    
    products.add(ProductItems("3ee", "Burger Mc Spicy", "Super Yummy", 50));        
  }
}
class ProductItems{
  String id;
  String title;
  String description;
  double price;
  ProductItems(this.id, this.title, this.description, this.price);
}