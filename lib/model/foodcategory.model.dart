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
