


import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foody/pages/dashboard/dashboard.page.dart';
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


}