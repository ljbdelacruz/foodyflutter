import 'package:flutter/material.dart';
import 'package:foody/components/footer/dashboard.footer.dart';
import 'package:foody/components/header/design3.header.dart';
import 'package:foody/components/header/floating.header.dart';
import 'package:foody/components/sidebar/dashboard.sidemenu.dart';
import 'package:foody/components/subui/image/imagecarousel.subui.dart';
import 'package:foody/components/subui/listviews/collectionlist.subui.dart';
import 'package:foody/components/subui/listviews/productcardlist.subui.dart';
import 'package:foody/config/Constants.config.dart';
import 'package:foody/services/navigator.service.dart';

class DashboardPage extends StatefulWidget{
  final DashboardPageVM vm=DashboardPageVM();
  DashboardPage();
  @override
  DashboardPageState createState() => DashboardPageState();
}
class DashboardPageState extends State<DashboardPage> {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  @override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: FloatingDashboardHeader(FloatingDashboardHeaderVM(), body(), footer(), endDrawer(), _drawerKey, (index){
          switch(index){
            case 0:
              //cart
              NavigatorService.instance.toCart(context);
              break;
            case 1:
              //search
              NavigatorService.instance.toProductList(context);
              break;
          }
        })
      );
  }
  _sideMenuOptions(int type){
    switch(type){
      case 0:
        //Home
        break;
      default:
        break;
    }
  }
  Widget endDrawer(){
    return DashboardSideMenu(widget.vm.sideMenu,_sideMenuOptions);
  }

  Widget body(){
    return SingleChildScrollView(child:Column(
            children: [
              ImageCarouselSubUI(widget.vm.image, (index){}),
              Container(height: 300, 
                child:CollectionListSubUI(widget.vm.category, (index){
                  //index here of item selected
                  NavigatorService.instance.toProductList(context);
                }),
              ),
              ProductCardListSubUI(widget.vm.productVM, (index){})

            ],),
        );
  }
  Widget footer(){
    return DashboardFooter(widget.vm.footer, (index){
          //footer item selected
          switch(index){
            case 0:
              break;
            case 1:
              //add new product
              NavigatorService.instance.toSelectPayment(context);
              break;
            case 2:
              NavigatorService.instance.toMessagePage(context);
              break;
            case 3:
              //notification page
              // NavigatorService.instance.toMessagePage(context);
              break;
            case 4:
              //activity page
              NavigatorService.instance.toActivity(context);
              break;
          }
        });
  }

}

class DashboardPageVM{
  Design3HeaderVM header;
  CollectionListSubUIVM category;
  ImageCarouselSubUIVM image;
  DashboardFooterVM footer;
  DashboardSideMenuVM sideMenu;
  ProductCardListSubUIVM productVM;

  DashboardPageVM(){
    this.productVM=ProductCardListSubUIVM();
    this.header=Design3HeaderVM();
    category=CollectionListSubUIVM(3, 3);
    Constants.instance.fcategory.fcategory.asMap().forEach((index,item){
      category.appendItems(index, item.title, item.image);
    });
    this.sideMenu=DashboardSideMenuVM.user("Hello", Constants.instance.userLoginData.firstName+" "+Constants.instance.userLoginData.lastName);    
    this.image=ImageCarouselSubUIVM();
    this.footer=DashboardFooterVM.foodyDashboard();    
  }
}