import 'package:flutter/material.dart';
import 'package:foody/components/subui/listviews/collectionlist.subui.dart';
import 'package:foody/methodinterface/widget.interface.dart';
import 'package:foody/services/Color.service.dart';

class DashboardFooter extends StatelessWidget {
  final GetIntData callback;
  final DashboardFooterVM vm;
  DashboardFooter(this.vm, this.callback);
    @override
    Widget build(BuildContext context) {
      return Container(height:80, child: CollectionListSubUI(vm.collectionVM, (index){
        //selected item index
        callback(index);
      }));
    }
}

class DashboardFooterVM{
  CollectionListSubUIVM collectionVM; 
  Color bgColor=ColorsService.instance.primaryColor();
  DashboardFooterVM(){
    this.collectionVM=CollectionListSubUIVM(4,4);
  }
  DashboardFooterVM.foodyDashboard(){
    this.collectionVM=CollectionListSubUIVM.footer(4,4,4);
    this.collectionVM.appendItems(0, "", "assets/images/home.png");
    this.collectionVM.appendItems(1, "", "assets/images/plus.png");
    this.collectionVM.appendItems(2, "", "assets/images/search.png");
    this.collectionVM.appendItems(3, "", "assets/images/notification.png");
  }
}