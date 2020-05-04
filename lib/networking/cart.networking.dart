


import 'package:foody/config/Constants.config.dart';
import 'package:foody/methodinterface/widget.interface.dart';
import 'package:foody/model/cart.model.dart';
import 'package:foody/services/networking.service.dart';

class CartNetworking{
  static CartNetworking instance =CartNetworking();
  newCart(CartParam param, GetCartModelData scall,GetStringData fcall){
    NetworkingService.instance.postRequest(Constants.instance.baseURL+"v1/cart/new", param.toNewCartParam(), NetworkingService.instance.sheader(), (data){
      CartModel model=CartModel.json(data["data"]);
      print(data);
    }, fcall);
  }
  getCartByOwnerId(String oid, GetListCartModelData scall,GetStringData fcall){
    NetworkingService.instance.getRequest(Constants.instance.baseURL+"v1/cart/"+oid, NetworkingService.instance.sheader(), (data){
      List<CartModel> models = [];
      data["data"].forEach((item){
        CartModel model = CartModel.json(item);
        models.add(model);
      });
      scall(models);
    }, fcall);
  }
  //Cart Item
  newCartItem(CartParam param,GetCartItemModelData scall, GetStringData fcall){
    NetworkingService.instance.postRequest(Constants.instance.baseURL+"v1/cart/new/cartitem", param.toNewCartItem(), NetworkingService.instance.sheader(), (data){
      CartItemModel model = CartItemModel.json(data["data"]);
      scall(model);
    }, fcall);
  }
  getCartItemByCartId(String id, GetListCartItemModelData scall,GetStringData fcall){
    NetworkingService.instance.getRequest(Constants.instance.baseURL+"v1/cartitem/"+id, NetworkingService.instance.sheader(), (data){
      List<CartItemModel> models = [];
      data["data"].forEach((item){
        CartItemModel model = CartItemModel.json(item);
        models.add(model);
      });
      scall(models);
    }, fcall);
  }


}