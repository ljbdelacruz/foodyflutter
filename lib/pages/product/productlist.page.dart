import 'package:flutter/material.dart';
import 'package:foody/components/header/design3.header.dart';


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
                        child: Scaffold(
                        appBar: PreferredSize(child: Design3Header(widget.vm.header, (){
                          //btn clicked
                        }), preferredSize: Size.fromHeight(100)),
                        backgroundColor: Colors.transparent,
                        body: 
                          SingleChildScrollView(child:Column(
                              children: [
                                Text("Product List Page")
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
  ProductListPageVM(){
    this.header=Design3HeaderVM();
  }
}