import 'package:flutter/material.dart';
import 'package:foody/components/label/titletext.label.dart';
import 'package:foody/themes/lightcolor.themes.dart';

class ProductCardCells extends StatefulWidget {
  final ProductCardCellsVM vm;
  ProductCardCells(this.vm);
  @override
  ProductCardCellsState createState() => ProductCardCellsState();
}

class ProductCardCellsState extends State<ProductCardCells> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigator.of(context).pushNamed('/detail');
        setState(() {
          
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: LightColor.background,
          borderRadius: BorderRadius.all(Radius.circular(20)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Color(0xfff8f8f8), blurRadius: 15, spreadRadius: 10),
          ],
        ),
        margin: EdgeInsets.symmetric(vertical: !widget.vm.isSelected ? 20 : 0),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              left: 0,
              top: 0,
              child: IconButton(
                icon: Icon(widget.vm.isLiked ? Icons.favorite : Icons.favorite_border, color: widget.vm.isLiked ? LightColor.red : LightColor.iconColor,),
                 onPressed: (){
                   setState(() {
                     widget.vm.isLiked = !widget.vm.isLiked ;
                   });
                 })
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SizedBox(height: widget.vm.isSelected ? 15 : 0),
                Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: LightColor.orange.withAlpha(40),
                    ),
                    Image.asset(widget.vm.image)
                  ],
                ),
                // SizedBox(height: 5),
                TitleText(
                  text: widget.vm.name,
                  fontSize: widget.vm.isSelected ? 16 : 14,
                ),
                TitleText(
                  text: widget.vm.category,
                  fontSize: widget.vm.isSelected ? 14 : 12,
                  color: LightColor.orange,
                ),
                TitleText(
                  text: widget.vm.price.toString(),
                  fontSize: widget.vm.isSelected ? 18 : 16,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


class ProductCardCellsVM{
  String image;
  String name;
  double price;
  bool isSelected=false;
  bool isLiked = false;
  String category;
  ProductCardCellsVM(this.image, this.name, this.price, this.isSelected, this.isLiked, this.category);

  ProductCardCellsVM.dum1(){
    this.image="assets/images/home.png";
    this.name="Queens Burger";
    this.price=249;
    this.isSelected=true;
    this.isLiked=true;
    this.category="Hot Selling Item";
  }
  ProductCardCellsVM.dum2(){
    this.image="assets/images/home.png";
    this.name="Queens Burger 2";
    this.price=249;
    this.isSelected=false;
    this.isLiked=false;
    this.category="Hot Selling Item";
  }

  


}