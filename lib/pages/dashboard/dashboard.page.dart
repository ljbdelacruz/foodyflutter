import 'package:flutter/material.dart';
import 'package:foody/components/footer/dashboard.footer.dart';
import 'package:foody/components/header/design1.header.dart';
import 'package:foody/components/sidebar/dashboard.sidemenu.dart';
import 'package:foody/components/subui/listviews/collectionlist.subui.dart';
import 'package:foody/config/Constants.config.dart';
import 'package:foody/services/navigator.service.dart';

class DashboardPage extends StatefulWidget{
  final DashboardPageVM vm=DashboardPageVM();
  DashboardPage();
  @override
  _DashboardPageState createState() => _DashboardPageState();
}
class _DashboardPageState extends State<DashboardPage> {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  
  @override
  void dispose() {
    super.dispose();
  }

  viewProductInfoPage(){

  }
  //handler for sidemenu
  _sideMenuOptions(int type){
    switch(type){
      case 0:
        //Home
        break;
      default:
        break;
    }
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Container(
      color: Colors.pink,
      child: Scaffold(
      key: _drawerKey,        
      appBar:PreferredSize(preferredSize: Size.fromHeight(100), child: Design1Header(widget.vm.header, (index){
        //selected menu
        if(index != 0){
          _drawerKey.currentState.openEndDrawer();
        }
      })),
      backgroundColor: Colors.transparent,
      body: 
        SingleChildScrollView(child:Column(
            children: [
              Container(height: 300, 
                child:CollectionListSubUI(widget.vm.category, (index){
                  //index here of item selected
                  NavigatorService.instance..toProductInfo(context);
                }),
              ),
            ],),
        ),
        endDrawer: DashboardSideMenu(widget.vm.sideMenu,_sideMenuOptions),
        bottomNavigationBar:DashboardFooter(widget.vm.footer, (index){
          //footer item selected
          switch(index){
            case 0:
              break;
            case 1:
              //add new product
              NavigatorService.instance.toEditProduct(context);
              break;
            case 2:
              NavigatorService.instance.toProductList(context);
              break;
            case 3:
              //notification page
              break;
          }
        })
            
      ),
      ),
    );
  }
}

class DashboardPageVM{
  DashboardFooterVM footer;
  Design1HeaderVM header;
  CollectionListSubUIVM category;
  DashboardSideMenuVM sideMenu;
  DashboardPageVM(){
    this.header=Design1HeaderVM.mydefault();
    category=CollectionListSubUIVM(3, 3);
    Constants.instance.fcategory.fcategory.asMap().forEach((index,item){
      category.appendItems(index, item.title, item.image);
    });
    this.sideMenu=DashboardSideMenuVM.user("Hello", Constants.instance.fbLoginInfo.name);
    this.footer=DashboardFooterVM.foodyDashboard();
  }
}
