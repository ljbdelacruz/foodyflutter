


import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foody/model/product.model.dart';
import 'package:foody/pages/activity/activity.page.dart';
import 'package:foody/pages/cart/cart.page.dart';
import 'package:foody/pages/dashboard/dashboard.page.dart';
import 'package:foody/pages/delivery/userdeliverymap.page.dart';
import 'package:foody/pages/delivery/userdeliverystatus.page.dart';
import 'package:foody/pages/messages/chat.page.dart';
import 'package:foody/pages/messages/messages.page.dart';
import 'package:foody/pages/payment/selectpayment.page.dart';
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
  toProductInfo(BuildContext context, ProductItemModel item){
    Navigator.push(context,MaterialPageRoute(builder: (context) => ViewProductPage(ViewProductPageVM.selectedProd(item))));          
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

  //cart page
  toCart(BuildContext context){
    Navigator.push(context,MaterialPageRoute(builder: (context) => CartPage()));          
  }

  //select payment
  toSelectPayment(BuildContext context){
    Navigator.push(context,MaterialPageRoute(builder: (context) => SelectPaymentPage()));          
  }


  //chat pages
  toMessagePage(BuildContext context){
    Navigator.push(context,MaterialPageRoute(builder: (context) => MessagePage()));          
  }
  toChatPage(BuildContext context){
    Navigator.push(context,MaterialPageRoute(builder: (context) => ChatPage()));          
  }
}