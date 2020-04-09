import 'package:flutter/material.dart';
import 'package:foody/components/header/design3.header.dart';
import 'package:foody/components/subui/listviews/cells/category.cells.dart';
import 'package:foody/components/subui/listviews/collectionlist.subui.dart';
import 'package:foody/components/subui/listviews/searchlistproduct.subui.dart';
import 'package:foody/config/Constants.config.dart';
import 'package:foody/services/navigator.service.dart';


class ProductListPage extends StatefulWidget{
  final ProductListPageVM vm=ProductListPageVM();
  ProductListPage();
  @override
  _ProductListPageState createState() => _ProductListPageState();
}
class _ProductListPageState extends State<ProductListPage> {
  @override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
                        color:Constants.instance.themeColor,
                        child: Scaffold(
                        appBar: PreferredSize(child: Design3Header(widget.vm.header, (){
                          //btn clicked
                        }), preferredSize: Size.fromHeight(100)),
                        backgroundColor: Colors.transparent,
                        body:
                          SingleChildScrollView(child:Column(
                              children: [
                                Container(height: 80, child: SearchListProductSubUI(widget.vm.searchBar, (search){
                                  //selected item
                                  print(search);
                                })),
                                Container(height:MediaQuery.of(context).size.height * 0.7,
                                      child: CollectionListSubUI(widget.vm.products, (index){
                                        //selected item index
                                        NavigatorService.instance.toProductInfo(context);
                                      })
                                )
                              ]
                          )
                          )
                        ,),
        )
      );
  }
}

class ProductListPageVM{
  Design3HeaderVM header;
  CollectionListSubUIVM products;
  SearchListProductSubUIVM searchBar;

  ProductListPageVM(){
    this.header=Design3HeaderVM();
    this.products=CollectionListSubUIVM.product(2,2,2,10,10);
    this.searchBar=SearchListProductSubUIVM("Search Products", Constants.instance.fbLoginInfo.firstName.substring(0,1)+Constants.instance.fbLoginInfo.lastName.substring(0,1));

    Constants.instance.products.items.asMap().forEach((index, item){
      this.products.appendProductItemCells(index, item.title, item.price.toString(), item.mainImage);
    });
  }
  ProductListPageVM.products(List<CategoryCellsVM> items){
    this.header=Design3HeaderVM();
    this.products=CollectionListSubUIVM.product(4,4,4,0,0);
    this.products.items = items;
  }

}