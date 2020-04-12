import 'package:flutter/material.dart';
import 'package:foody/themes/lightcolor.themes.dart';




class ThumbnailImage extends StatelessWidget {
  final ThumbnailImageVM vm;
  ThumbnailImage(this.vm);
  @override
  Widget build(BuildContext context) {
    return _categoryWidget(context);
  }

  Widget _categoryWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 0),
      width: vm.width,
      height: 80,
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children:
              vm.images.map((x) => _thumbnail(x)).toList()),
    );
  }

  Widget _thumbnail(String image) {
    return AnimatedBuilder(
        animation: vm.animation,
        //  builder: null,
        builder: (context, child) => AnimatedOpacity(
              opacity: vm.opacity,
              duration: Duration(milliseconds: 500),
              child: child,
            ),
        child: Container(
          height: 40,
          width: 50,
          margin: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            border: Border.all(
              color: LightColor.grey,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(13),
            ),
            // color: Theme.of(context).backgroundColor,
          ),
          child: Image.asset(image),
        ));
  }
}

class ThumbnailImageVM{
  double width = 300;
  double opacity = 1;
  Animation<double> animation;
  List<String> images = [];
  ThumbnailImageVM(this.width, this.opacity, this.animation, this.images){
    // this.images.add("assets/images/sample_1.png");
    // this.images.add("assets/images/sample_1.png");
    // this.images.add("assets/images/sample_1.png");       
  }
}