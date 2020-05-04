

import 'package:foody/config/Constants.config.dart';
import 'package:foody/methodinterface/widget.interface.dart';
import 'package:foody/model/users.model.dart';
import 'package:foody/services/networking.service.dart';

class UsersInfoNetworking{
  static UsersInfoNetworking instance=UsersInfoNetworking();

  userLogin(UserNetworkingParam param, GetUserModelData scall, GetStringData fcall){
    NetworkingService.instance.postRequest(Constants.instance.baseURL+"v1/users/userLogin", param.toUserLoginParam(), {}, (data){
      UsersModel model=UsersModel.json(data["data"]);
      scall(model);
    }, fcall);
  }
  userRegister(UserNetworkingParam param, GetUserModelData scall, GetStringData fcall){
    NetworkingService.instance.postRequest(Constants.instance.baseURL+"v1/users/userRegister", param.toUserRegisterParam(), {}, (data){
      UsersModel model=UsersModel.json(data["data"]);
      scall(model);
    }, fcall);
  }
  fbLogin(UserNetworkingParam param, GetUserModelData scall, GetStringData fcall){
    NetworkingService.instance.postRequest(Constants.instance.baseURL+"v1/users/fblogin", param.toFbLoginParam(), NetworkingService.instance.sheader(), (data){
      UsersModel model=UsersModel.json(data["data"]);
      scall(model);
    }, fcall);
  }
}