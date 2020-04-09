import 'package:flutter/material.dart';
import 'package:foody/components/footer/order.footer.dart';
import 'package:foody/components/header/design3.header.dart';
import 'package:foody/components/subui/image/imagecarousel.subui.dart';
import 'package:foody/config/Constants.config.dart';


class ViewProductPage extends StatefulWidget{
  final ViewProductPageVM vm=ViewProductPageVM();
  ViewProductPage();
  @override
  _ViewProductPageState createState() => _ViewProductPageState();
}
class _ViewProductPageState extends State<ViewProductPage> {
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
                                ImageCarouselSubUI(widget.vm.images, (index){
                                  //index here 
                                }),
                              ]
                          )
                          ),
                          bottomNavigationBar:OrderFooter(widget.vm.footer, (){}, (){})
                        ,),
        )
      );
  }
}

class ViewProductPageVM{
  Design3HeaderVM header;
  ImageCarouselSubUIVM images;
  OrderFooterVM footer;
  ViewProductPageVM(){
    this.images=ImageCarouselSubUIVM();
    this.header=Design3HeaderVM();
    this.footer=OrderFooterVM.order();
  }
}