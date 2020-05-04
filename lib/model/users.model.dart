


import 'package:foody/config/Constants.config.dart';
import 'package:foody/services/verifier.service.dart';

class UsersModel{
  String id;
  String firstName;
  String lastName;
  double userReview=0;
  String profileImage;
  String fbId;
  int accountAccessType=0;
  AccountAccessType accessType = AccountAccessType.user;

  UsersModel.json(dynamic data){
    this.fbId=VerifierService.instance.validateString(data["fbId"]);
    this.id=VerifierService.instance.validateString(data["id"]);
    this.lastName=VerifierService.instance.validateString(data["lastName"]);
    this.firstName=VerifierService.instance.validateString(data["firstName"]);
    this.profileImage=VerifierService.instance.validateString(data["lastName"]);
    this.accountAccessType=VerifierService.instance.validateInt(data[""]);
  }

  UsersModel.dum1(){
    this.id="1ee";
    this.firstName="Rajesh";
    this.lastName="Koothrapoli";
    this.userReview=2;
    this.profileImage="assets/images/home.png";
  }
}


class UserNetworkingParam{
  String email;
  String password;
  String firstname;
  String lastname;
  String gender;
  DateTime dateOfBirth;
  String fbId;

  UserNetworkingParam.userLogin(this.email, this.password);
  Map<String, dynamic> toUserLoginParam(){
    return {"email":this.email, "password":this.password};
  }
  UserNetworkingParam.userRegister(this.firstname, this.lastname, this.email, this.password);
  Map<String, dynamic> toUserRegisterParam(){
    return {"email":this.email, "password":this.password, "firstName":this.firstname, "lastName":this.lastname};
  }
  //Facebook
  UserNetworkingParam.fbLogin(this.firstname, this.lastname, this.fbId);
  Map<String, dynamic> toFbLoginParam(){
    return {"firstName":this.firstname, "lastName":this.lastname, "fbId":this.fbId};
  }
}


