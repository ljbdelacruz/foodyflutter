import 'package:flutter/material.dart';
import 'package:foody/components/header/design3.header.dart';
import 'package:foody/components/subui/image/imagecarousel.subui.dart';


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
                          )
                        ,),
        )
      );
  }
}

class ViewProductPageVM{
  Design3HeaderVM header;
  ImageCarouselSubUIVM images;
  ViewProductPageVM(){
    this.images=ImageCarouselSubUIVM();
    this.header=Design3HeaderVM();
  }
}