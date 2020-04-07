import 'package:flutter/material.dart';
import 'package:foody/components/subui/listviews/collectionlist.subui.dart';
import 'package:foody/config/Constants.config.dart';

class DashboardPage extends StatefulWidget{
  final DashboardPageVM vm=DashboardPageVM();
  DashboardPage();
  @override
  _DashboardPageState createState() => _DashboardPageState();
}
class _DashboardPageState extends State<DashboardPage> {
  @override
  void dispose() {
    super.dispose();
  }

  viewProductInfoPage(){
    
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Container(
      color: Colors.pink,
      child: Scaffold(
      backgroundColor: Colors.transparent,
      body: 
        SingleChildScrollView(child:Column(
            children: [
              Container(height: 300, 
                child:CollectionListSubUI(widget.vm.category, (index){
                  //index here of item selected
                }),
              ),
              
            ],),
        )
            
      ,),
      ),
    );
  }
}

class DashboardPageVM{
  CollectionListSubUIVM category;
  DashboardPageVM(){
    category=CollectionListSubUIVM(3, 3);
    Constants.instance.fcategory.fcategory.asMap().forEach((index,item){
      category.appendItems(index, item.title, item.image);
    });    
  }
}
