


import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foody/pages/activity/activity.page.dart';
import 'package:foody/pages/dashboard/dashboard.page.dart';
import 'package:foody/pages/delivery/userdeliverymap.page.dart';
import 'package:foody/pages/delivery/userdeliverystatus.page.dart';
import 'package:foody/pages/product/editproduct.page.dart';
import 'package:foody/pages/product/productlist.page.dart';
import 'package:foody/pages/product/viewproduct.page.dart';

class NavigatorService{
  static NavigatorService instance=NavigatorService();

  toDashboard(BuildContext context){
    Navigator.push(context,MaterialPageRoute(builder: (context) => DashboardPage()));          
  }

  toProductList(BuildContext context){
    Navigator.push(context,MaterialPageRoute(builder: (context) => ProductListPage()));              
  }
  toEditProduct(BuildContext context){
    Navigator.push(context,MaterialPageRoute(builder: (context) => EditProductPage()));          
  }
  toProductInfo(BuildContext context){
    Navigator.push(context,MaterialPageRoute(builder: (context) => ViewProductPage()));          
  }

  //setting delivery location
  toUserDeliveryMap(BuildContext context){
    Navigator.push(context,MaterialPageRoute(builder: (context) => UserDeliveryMapPage()));          
  }
  toUserDeliveryStatus(BuildContext context){
    Navigator.push(context,MaterialPageRoute(builder: (context) => UserDeliveryStatusPage()));          
  }

  //to activity page
  toActivity(BuildContext context){
    Navigator.push(context,MaterialPageRoute(builder: (context) => ActivityPage()));          
  }

}