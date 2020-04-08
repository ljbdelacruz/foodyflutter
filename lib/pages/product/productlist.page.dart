import 'package:flutter/material.dart';
import 'package:foody/components/header/design3.header.dart';
import 'package:foody/components/subui/listviews/cells/category.cells.dart';
import 'package:foody/components/subui/listviews/collectionlist.subui.dart';
import 'package:foody/config/Constants.config.dart';


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
                                Text("Product List Page"),
                                Container(height:MediaQuery.of(context).size.height * 0.8,
                                      child: CollectionListSubUI(widget.vm.products, (index){
                                        //selected item index
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
  ProductListPageVM(){
    this.header=Design3HeaderVM();
    this.products=CollectionListSubUIVM.product(4,4,4,0,0);
  }
  ProductListPageVM.products(List<CategoryCellsVM> items){
    this.header=Design3HeaderVM();
    this.products=CollectionListSubUIVM.product(4,4,4,0,0);
    this.products.items = items;
  }

}