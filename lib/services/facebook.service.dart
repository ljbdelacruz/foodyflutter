import 'dart:convert';

import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:foody/methodinterface/widget.interface.dart';
import 'package:http/http.dart' as http;

class FacebookService{
  static FacebookService instance=FacebookService();
  final facebookLogin = FacebookLogin();

  getFacebookUserInfo(FacebookLoginResult result,String token, GetFBuUserInfo scall){
      print("Fetching facebook user services");
      final token = result.accessToken.token;
      http.get('https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email&access_token='+token).then((resp){
        final json = jsonDecode(resp.body);
        print(resp.body.toString());
        scall(FacebookUserInfo.json(json));
      });
  }


  fbLoginInit(NormalCallback cancel, GetStringData error, GetFBuUserInfo scall) async{
    final result = await facebookLogin.logIn(['email']);
    switch (result.status) {
        case FacebookLoginStatus.loggedIn:
          print("Facebook Login");
          print(result.accessToken.userId);
          getFacebookUserInfo(result, result.accessToken.token, scall);
          break;
        case FacebookLoginStatus.cancelledByUser:
          cancel();
          break;
        case FacebookLoginStatus.error:
          error(result.errorMessage);
          break;
    }

  }
}

class FacebookUserInfo{
  String email;
  String firstName;
  String lastName;
  String name;
  String id;
  FacebookUserInfo.json(dynamic data){
    this.email=data["email"].toString();
    this.firstName=data["first_name"].toString();
    this.lastName=data["last_name"].toString();
    this.name=data["name"].toString();
    this.id=data["id"].toString();
  }
}