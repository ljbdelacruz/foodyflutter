import 'package:flutter/material.dart';
import 'package:foody/components/label/titletext.label.dart';
import 'package:foody/themes/lightcolor.themes.dart';



class AnimatedImage extends StatelessWidget {
  final AnimatedImageVM vm;
  AnimatedImage(this.vm);
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        builder: (context, child) {
          return AnimatedOpacity(
            duration: Duration(milliseconds: 500),
            opacity: vm.opacity,
            child: child,
          );
        },
        animation: vm.animation,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            TitleText(
              text: vm.initial,
              fontSize: 160,
              color: LightColor.darkgrey,
            ),
            Image.asset(vm.image)
          ],
        ),
      );
  }
}

class AnimatedImageVM{
  String initial;
  double opacity;
  String image;
  Animation<double> animation;
  AnimatedImageVM(this.initial, this.opacity, this.animation, this.image);
}