

import 'package:foody/methodinterface/widget.interface.dart';
import 'package:foody/model/users.model.dart';
import 'package:foody/networking/usersinfo.networking.dart';

class UserPresenter{
  static UserPresenter instance=UserPresenter();
  userLogin(String email, String password, GetUserModelData scall, GetStringData fcall){
    UsersInfoNetworking.instance.userLogin(UserNetworkingParam.userLogin(email, password), (data){
      scall(data);
    }, fcall);
  }
  userRegister(String email, String password, String firstName, String lastName, GetUserModelData scall, GetStringData fcall){
    UsersInfoNetworking.instance.userRegister(UserNetworkingParam.userRegister(firstName, lastName, email, password), (data){
      scall(data);
    }, fcall);
  }
  fbLogin(String firstName, String lastName, String fbId, GetUserModelData scall, GetStringData fcall){
    UsersInfoNetworking.instance.fbLogin(UserNetworkingParam.fbLogin(firstName, lastName, fbId), (data){
      scall(data);
    }, fcall);
  }
}