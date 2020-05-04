


import 'package:foody/methodinterface/widget.interface.dart';
import 'package:foody/model/product.model.dart';
import 'package:foody/networking/product.networking.dart';

class ProductPresenter{
  static ProductPresenter instance=ProductPresenter();
  newProduct(String title, String desc, double price, String storeId, String category, GetProductItemData scall, GetStringData fcall){
    ProductNetworking.instance.newProduct(ProductParam.newProduct(title, desc, price, storeId, category), (data){
      scall(data);
    }, fcall);
  }
  getProductByCategory(String category, GetListProductItemData scall, GetStringData fcall){
    ProductNetworking.instance.getProductByCategory(category, scall, fcall);
  }
}