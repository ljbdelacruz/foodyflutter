

import 'package:foody/config/Constants.config.dart';
import 'package:foody/methodinterface/widget.interface.dart';
import 'package:foody/model/product.model.dart';
import 'package:foody/services/networking.service.dart';

class ProductNetworking{
  static ProductNetworking instance=ProductNetworking();
  newProduct(ProductParam param, GetProductItemData scall, GetStringData fcall){
    NetworkingService.instance.postRequest(Constants.instance.baseURL+"v1/product/new", param.toNewParam(), NetworkingService.instance.sheader(), (data){
      ProductItemModel model = ProductItemModel.json(data);
      scall(model);
    }, fcall);
  }
  updateById(ProductParam param, GetProductItemData scall, GetStringData fcall){
    NetworkingService.instance.putRequest(Constants.instance.baseURL+"v1/product/update/"+param.id, param.toParamUpdateById(), NetworkingService.instance.sheader(), (data){
      ProductItemModel model = ProductItemModel.json(data);
      scall(model);
    }, fcall);
  }
  updateProductLocationByStoreId(ProductParam param, GetProductItemData scall, GetStringData fcall){
    NetworkingService.instance.putRequest(Constants.instance.baseURL+"v1/product/update/location/"+param.storeId, param.toParamUpdateProductLocation(), NetworkingService.instance.sheader(), (data){
      ProductItemModel model = ProductItemModel.json(data);
      scall(model);
    }, fcall);
  }

  getProductByCategory(String category, GetListProductItemData scall, GetStringData fcall){
    NetworkingService.instance.getRequest(Constants.instance.baseURL+"v1/product/"+category, NetworkingService.instance.sheader(), (data){
        extractData(data, scall, fcall);
    }, fcall);
  }
  getByLocation(ProductParam param, GetListProductItemData scall, GetStringData fcall){
    try{
      NetworkingService.instance.getRequest(Constants.instance.baseURL+"v1/product/location/"+param.radius.toString()+"/"+param.longitude.toString()+"/"+param.latitude.toString(), NetworkingService.instance.sheader(), (data){
        extractData(data, scall, fcall);
      }, fcall);
    }catch(e){
      fcall("Unable to process Request");
    }
  }
  getByLocationCategory(ProductParam param, GetListProductItemData scall, GetStringData fcall){
    try{
      NetworkingService.instance.getRequest(Constants.instance.baseURL+"v1/product/location/"+param.radius.toString()+"/"+param.longitude.toString()+"/"+param.latitude.toString()+"/"+param.category, NetworkingService.instance.sheader(), (data){
        extractData(data, scall, fcall);
      }, fcall);
    }catch(e){
      fcall("Unable to process Request");
    }
  }
  getByStoreId(ProductParam param, GetListProductItemData scall, GetStringData fcall){
    try{
      NetworkingService.instance.getRequest(Constants.instance.baseURL+"v1/product/store/"+param.storeId, NetworkingService.instance.sheader(), (data){
        extractData(data, scall, fcall);
      }, fcall);
    }catch(e){
      fcall("Unable to process Request");
    }
  }
  getByReview(ProductParam param, GetListProductItemData scall, GetStringData fcall){
      NetworkingService.instance.getRequest(Constants.instance.baseURL+"v1/product/review/"+param.review.toString(), NetworkingService.instance.sheader(), (data){
        extractData(data, scall, fcall);
      }, fcall);
  }
  getByReviewOrder(ProductParam param, GetListProductItemData scall, GetStringData fcall){
      NetworkingService.instance.getRequest(Constants.instance.baseURL+"v1/product/review/order/"+param.order, NetworkingService.instance.sheader(), (data){
        extractData(data, scall, fcall);
      }, fcall);
  }
  getBySearchTitleLocation(ProductParam param, GetListProductItemData scall, GetStringData fcall){
      NetworkingService.instance.getRequest(Constants.instance.baseURL+"v1/product/search/"+param.searchText+"/"+param.radius.toString()+"/"+param.longitude.toString()+"/"+param.latitude.toString()+"/"+param.limit.toString(), NetworkingService.instance.sheader(), (data){
        extractData(data, scall, fcall);
      }, fcall);
  }




  //TODO: function for extracting json list of product
  extractData(dynamic data,GetListProductItemData scall, GetStringData fcall){
    try{
        List<ProductItemModel> items = [];
        data["data"].forEach((item){
          ProductItemModel model=ProductItemModel.json(item);
          items.add(model);
        });
        scall(items);
    }catch(e){
      fcall("Unable to process data");
    }
  }





}