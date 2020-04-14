import 'package:flutter/material.dart';
import 'package:foody/components/footer/order.footer.dart';
import 'package:foody/components/header/design4.header.dart';
import 'package:foody/components/image/animated.image.dart';
import 'package:foody/components/image/thumbnail.image.dart';
import 'package:foody/components/subui/drag/productinfo.drag.dart';
import 'package:foody/components/subui/image/imagecarousel.subui.dart';
import 'package:foody/config/Constants.config.dart';
import 'package:foody/model/product.model.dart';
import 'package:foody/services/Snackbar.service.dart';


class ViewProductPage extends StatefulWidget{
  final ViewProductPageVM vm;
  ViewProductPage(this.vm);
  @override
  _ViewProductPageState createState() => _ViewProductPageState();
}
class _ViewProductPageState extends State<ViewProductPage> with TickerProviderStateMixin{
  AnimationController controller;  
  Animation<double> animation;  
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    this.animation=Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(parent: controller, curve: Curves.easeInToLinear));    
  }

  @override
  void dispose() {
    super.dispose();
    this.controller.dispose();
    this._drawerKey.currentState.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
                        color:Constants.instance.themeColor,
                        child: Scaffold(
                        key:_drawerKey,
                        floatingActionButton: floatingButton(context),                          
                        backgroundColor: Colors.transparent,
                        body: 
                          Stack(children:[
                            Column(
                              children: [
                                Padding(padding: EdgeInsets.fromLTRB(20, 20, 20, 20), child: PreferredSize(preferredSize: Size.fromHeight(100), child: Design4Header(widget.vm.header, (){
                                  setState(() {
                                    widget.vm.header.isLiked = !widget.vm.header.isLiked;
                                  });
                                }))),
                                Container(height: 200, child: AnimatedImage(AnimatedImageVM("LJS", 1, this.animation, widget.vm.selectedProd.mainImage))),
                                Container(height:100, child: ThumbnailImage(ThumbnailImageVM(MediaQuery.of(context).size.width, 1, animation, widget.vm.selectedProd.thumbnails)))
                              ]
                            ),
                            ProductInfoDragSubUI(widget.vm.productInfoVM)
                          ])
                          // bottomNavigationBar:OrderFooter(widget.vm.footer, (){}, (){})
                        ),
        )
      );
  }


  Widget floatingButton(BuildContext context){
    return FloatingActionButton(
      onPressed: () {
        //TODO: add item to cart
        print("Added item on cart");
        widget.vm.addItemToCart(context);
        _drawerKey.currentState.showSnackBar(SnackBarService.instance.showCartSnackBar(context, " Added to cart!"));
      },
      child: Icon(Icons.shopping_cart),
      backgroundColor: Colors.green,
    );
  }


}

class ViewProductPageVM{
  ProductItemModel selectedProd;
  Design4HeaderVM header;
  OrderFooterVM footer;
  ProductInfoDragSubUIVM productInfoVM;

  ViewProductPageVM.selectedProd(this.selectedProd){
    this.header=Design4HeaderVM();
    this.footer=OrderFooterVM.order();
    this.productInfoVM = ProductInfoDragSubUIVM.setup(this.selectedProd.title, this.selectedProd.price.toString(), this.selectedProd.desc, this.selectedProd.rating, this.selectedProd.reviewerCount);
  }
  addItemToCart(BuildContext context){
    print("cart");
    print(Constants.instance.cart.items.length);
    
    if(Constants.instance.cart.items.length > 0){
      var item=Constants.instance.cart.items.where((item){ return item.product.id == selectedProd.id; });
      print(selectedProd.id);
      print("Search item length");
      print(item.length);
      if(item.length > 0){
        print("Execute here");
        item.first.quantity=item.first.quantity+1;
      }else{
        print("Adding new item");
        print(this.selectedProd.id);
        Constants.instance.cart.appendItem(this.selectedProd, 1);
      }
    }else{
      print("Adding item to the cart");
      Constants.instance.cart.appendItem(this.selectedProd, 1);
    }

  }
}