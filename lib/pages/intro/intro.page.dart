
import 'package:flutter/material.dart';
import 'package:foody/config/Constants.config.dart';
import 'package:intro_views_flutter/Models/page_view_model.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';

class IntroPage extends StatefulWidget{
  final IntroPageCallbackFinshed callback;
  final IntroPageVM vm = IntroPageVM();
  IntroPage(this.callback);
  @override
  _IntroPageState createState() => _IntroPageState();
}
class _IntroPageState extends State<IntroPage> {
  static IntroPageVM vm=IntroPageVM();  
  @override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Column(children: [
        Container(child: IntroViewsFlutter(
          vm.pages,
          showNextButton: true,
          showBackButton: true,
          onTapDoneButton: () {
            widget.callback(context);
          },
          pageButtonTextStyles: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
          ),
        ),height: MediaQuery.of(context).size.height-50,)
      ],),
    )
   );
  }
}
typedef IntroPageCallbackFinshed = void Function(BuildContext context);


class IntroPageVM{
  double imageHeight=285.0;
  double imageWidth=285.0;
  double fontSize=20;
  List<PageViewModel> pages=[];
  IntroPageVM(){
    if(Constants.instance.device.height < 900){
      this.setLowResDevice();
    }
    this.setupIntro();
  }
  setupIntro(){
    pages.add(getPage("Food Convenience", "Have food delivery while you wait", "assets/images/plus.png"));
    pages.add(getPage("Pay", "Pay via EMoney or Credit card", "assets/images/plus.png"));    
  }
  setLowResDevice(){
    this.imageHeight=200;
    this.imageHeight=200;
    this.fontSize=15;
  }
  PageViewModel getPage(String title, String desc, String image){
    return PageViewModel(
        pageColor: const Color(0xFF03A9F4),
        // iconImageAssetPath: 'assets/air-hostess.png',
        // bubble: Image.asset('assets/images/elect.png'),
        body: Text(
          desc,
        ),
        title: Text(
          title,
        ),
        titleTextStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white),
        bodyTextStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white, fontSize: this.fontSize),
        mainImage: Image.asset(image,
          height: this.imageHeight,
          width: this.imageWidth,
          alignment: Alignment.center,
    ));
  }
}
