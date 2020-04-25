import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:foody/model/cart.model.dart';
import 'package:foody/model/foodcategory.model.dart';
import 'package:foody/model/product.model.dart';
import 'package:foody/model/topay.model.dart';
import 'package:foody/services/facebook.service.dart';
import 'package:foody/themes/lightcolor.themes.dart';

class Constants{
  static Constants instance=Constants();
  
  DeviceInfo device=DeviceInfo.mydefault();
  Color themeColor=LightColor.lightGrey;
  FacebookUserInfo fbLoginInfo=FacebookUserInfo();
  String currency="";
  int currencyCode=0;
  ProductModel products;
  FoodCategoryVM fcategory=FoodCategoryVM();
  CartModel cart = CartModel();
  ToPayListModel topaylist = ToPayListModel();


  Constants(){
    this.cart=CartModel();
    this.fcategory.setupDummyData();
    this.products=ProductModel.dum1();
  }
  setupProductCategory(){
    
  }
}

enum AccountAccessType{
  user, merchant
}





class DeviceInfo{
  String deviceId="1ee";
  String deviceType="I";
  String appVersion="1.02";
  String osVersion="1.0";
  String manufacturer;
  double width=0;
  double height=0;
  BuildContext context;

  DeviceInfo.mydefault(){
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();    
    if(Platform.isIOS){
      deviceInfo.iosInfo.then((data){
        this.deviceId=data.identifierForVendor;
      });
      this.deviceType="I";
      this.manufacturer="Apple";
    }else{
      deviceInfo.androidInfo.then((data){
        print("DEVICE INFO ANDROID");
        print(data.fingerprint);
        this.deviceId=data.androidId;
      });
      this.manufacturer="Android";      
      this.deviceType="A";      
    }
  }

  String getDeviceInfo(){
        return jsonEncode({"DeviceVersion" :'Iphone 7', "IMEINumber" : "",
                    "NetworkCountryISO" : 150,
                    "SIMCountryISO" :340,
                    "SIMSerialID" : "",
                    "SIMState" : "",
                           "UUIDNumber" :"1ee",
                           "DeviceManufacturer" : "Apple",
                           "PhoneNumber" : "09394242879",
                           "DeviceOS" : "",
                           "BuildVersion" : ""
          });
  }
  double getDeviceHeightDashboard(BuildContext context, double navBarHeight, double footerNavHeight){
    return (MediaQuery.of(context).size.height - navBarHeight) - footerNavHeight;
  }
  double getDeviceWidth(){
    this.width=window.physicalSize.width;
    return width;
  }
  double getDeviceHeight(){
    this.height=window.physicalSize.height;
    return height;
  }



}
