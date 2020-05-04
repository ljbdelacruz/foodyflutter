

import 'package:foody/config/Constants.config.dart';
import 'package:foody/methodinterface/widget.interface.dart';
import 'package:foody/model/category.model.dart';
import 'package:foody/services/networking.service.dart';

class CategoryNetworking{
  static CategoryNetworking instance=CategoryNetworking();

  newCategory(CategoryParam param, GetCategoryModelData scall, GetStringData fcall){
    NetworkingService.instance.postRequest(Constants.instance.baseURL+"v1/category/new", param.toNewParam(), NetworkingService.instance.sheader(), (data){
      CategoryModel model=CategoryModel.json(data);
      scall(model);
    }, fcall);
  }
  getByCategory(String category, GetListCategoryModelData scall, GetStringData fcall){
    NetworkingService.instance.getRequest(Constants.instance.baseURL+"v1/product/"+category, NetworkingService.instance.sheader(), (data){
      List<CategoryModel> items = [];
      data["data"].forEach((item){
        print(item);
        CategoryModel model=CategoryModel.json(item);
        items.add(model);
      });
      scall(items);
    }, fcall);
  }



}