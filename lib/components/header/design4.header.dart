import 'package:flutter/material.dart';
import 'package:foody/methodinterface/widget.interface.dart';
import 'package:foody/services/Color.service.dart';
import 'package:foody/themes/lightcolor.themes.dart';

class Design4Header extends StatelessWidget {
  final NormalCallback likedOnClick;
  final Design4HeaderVM vm;
  Design4Header(this.vm, this.likedOnClick);
    @override
    Widget build(BuildContext context) {
      return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: _icon(Icons.arrow_back_ios,
                          color: Colors.black54, size: 15, padding: 12, isOutLine: true, context:context),
                    ),
                    InkWell(
                      onTap: () {
                        //liked
                        this.likedOnClick();
                      },
                      child: _icon(vm.isLiked ? Icons.favorite : Icons.favorite_border,
                          color: vm.isLiked ? LightColor.red : LightColor.lightGrey,
                          size: 15,
                          padding: 12,
                          isOutLine: false, context:context),
                    )
                  ],
             );
            // automaticallyImplyLeading: false;
    }

    Widget _icon(IconData icon,
      {Color color = LightColor.iconColor,
      double size = 20,
      double padding = 10,
      bool isOutLine = false, BuildContext context}) {
    return Container(
      height: 40,
      width: 40,
      padding: EdgeInsets.all(padding),
      // margin: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        border: Border.all(
            color: LightColor.iconColor,
            style: isOutLine ? BorderStyle.solid : BorderStyle.none),
        borderRadius: BorderRadius.all(Radius.circular(13)),
        color:
            isOutLine ? Colors.transparent : Theme.of(context).backgroundColor,
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Color(0xfff8f8f8),
              blurRadius: 5,
              spreadRadius: 10,
              offset: Offset(5, 5)),
        ],
      ),
      child: Icon(icon, color: color, size: size),
    );
  }


}

class Design4HeaderVM{
  bool isLiked=false;
  Color bgColor=ColorsService.instance.primaryColor();
}