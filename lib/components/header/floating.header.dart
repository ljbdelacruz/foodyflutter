import 'package:flutter/material.dart';
import 'package:foody/components/buttons/image2.button.dart';
import 'package:foody/methodinterface/widget.interface.dart';
import 'package:foody/services/Color.service.dart';
import 'package:rounded_floating_app_bar/rounded_floating_app_bar.dart';


class FloatingDashboardHeader extends StatelessWidget {
  final GetIntData eventOnClick;
  final GlobalKey<ScaffoldState> drawerKey;
  final Widget body;
  final Widget endDrawer;
  final Widget footer;
  final FloatingDashboardHeaderVM vm;
  FloatingDashboardHeader(this.vm, this.body, this.footer, this.endDrawer, this.drawerKey, this.eventOnClick);

    @override
    Widget build(BuildContext context) {
      return Scaffold(
      key:this.drawerKey,
      bottomNavigationBar:this.footer,
      endDrawer:this.endDrawer,
      body: NestedScrollView(
        headerSliverBuilder: (context, isInnerBoxScroll) {
          return [
            RoundedFloatingAppBar(
              elevation: 10,
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.shopping_cart),
                  onPressed: () {
                    //shopping cart
                    this.eventOnClick(0);
                  },
                ),
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    //search on pressed
                    eventOnClick(1);
                  },
                ),
                IconButton(
                  icon: Icon(Icons.menu),
                  onPressed: () {
                    drawerKey.currentState.openEndDrawer();
                  },
                ),
              ],
              iconTheme: IconThemeData(
                color: Colors.black,
              ),
              textTheme: TextTheme(
                title: TextStyle(
                  color: Colors.black,
                ),
              ),
              floating: true,
              snap: true,
              title: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  FlutterLogo(),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Text(
                      "Foody",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),
                ],
              ),
              backgroundColor: Colors.white,
            ),
          ];
        },
        body: this.body)
      );
    }
}

class FloatingDashboardHeaderVM{
  Color bgColor=ColorsService.instance.primaryColor();
}