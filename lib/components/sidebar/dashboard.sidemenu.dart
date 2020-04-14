import 'package:flutter/material.dart';

class DashboardSideMenu extends StatelessWidget {
  final DashboardSideMenuCallback onSideMenuClick;
  final DashboardSideMenuVM vm;
  DashboardSideMenu(this.vm, this.onSideMenuClick);

  _sideMenuOnClick(int index){

    //9-settings
    //10-Logout
    onSideMenuClick(index);
  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
          child: Column(children: [
            Text(vm.title, style: TextStyle(fontSize: 30, color: Colors.white),),
            Text(vm.subDesc, style: TextStyle(fontSize: 15, color:Colors.white),)
          ],)
        ),
        for ( var i in vm.items ) 
        ListTile(
          leading: Image.asset(i.image, width:30, height:30),
          title: Text(i.title),
          onTap: (){
            Navigator.pop(context);                
            _sideMenuOnClick(i.value);
          },                    
        ),
      ],
    ),
    );
  }
}

typedef DashboardSideMenuCallback = void Function(int sideBar);

class DashboardSideMenuVM{
  String title;
  String subDesc;
  List<DashboardSideMenuItemVM> items;
  DashboardSideMenuVM(this.items);
  DashboardSideMenuVM.user(this.title, this.subDesc){
    items=[
           DashboardSideMenuItemVM("assets/images/sidemenu/home.png", "Home", 1),      
           DashboardSideMenuItemVM("assets/images/sidemenu/wallet.png", "Apply as Merchant", 2),
           DashboardSideMenuItemVM("assets/images/sidemenu/settings.png", "Settings", 3),
           DashboardSideMenuItemVM("assets/images/sidemenu/info.png", "Help Center", 4),
           DashboardSideMenuItemVM("assets/images/sidemenu/tac.png", "Terms and Conditions", 5),           
           DashboardSideMenuItemVM("assets/images/sidemenu/logout.png", "Logout", 10)];
  }
}
class DashboardSideMenuItemVM{
  String image;
  IconData icon;
  String title;
  int value;
  DashboardSideMenuItemVM(this.image, this.title, this.value);
}



