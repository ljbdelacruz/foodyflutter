


import 'package:foody/config/Constants.config.dart';
import 'package:foody/methodinterface/widget.interface.dart';
import 'package:foody/model/imagestorage.model.dart';
import 'package:foody/services/networking.service.dart';

class ImageStorageNetworking{
  static ImageStorageNetworking instance=ImageStorageNetworking();

  newImage(ImageStorageParam param, GetImageStorageData scall, GetStringData fcall){
    NetworkingService.instance.postRequest(Constants.instance.baseURL+"v1/imagestorage/new", param.toNewParam(), NetworkingService.instance.sheader(), (data){
      print(data);
      ImageStorageModel model = ImageStorageModel.json(data["data"]);
      scall(model);
    }, fcall);
  }

  getByOwnerIdType(String oid, String type, GetListImageStorageData scall, GetStringData fcall){
    NetworkingService.instance.getRequest(Constants.instance.baseURL+"v1/imagestorage/"+oid+"/"+type, NetworkingService.instance.sheader(), (data){
      List<ImageStorageModel> models = [];
      data["data"].forEach((item){
        ImageStorageModel model = ImageStorageModel.json(item);
        models.add(model);
      });
      scall(models);
    }, fcall);
  }
  

}