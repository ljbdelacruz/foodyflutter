import 'package:flutter/material.dart';
import 'package:foody/components/buttons/image2.button.dart';
import 'package:foody/methodinterface/widget.interface.dart';
import 'package:foody/services/Color.service.dart';

class Design2Header extends StatelessWidget {
  final GetIntData callback;
  final Design2HeaderVM vm;
  Design2Header(this.vm, this.callback);
    @override
    Widget build(BuildContext context) {
      return PreferredSize(preferredSize: Size.fromHeight(200), child:Container(
              color: vm.bgColor,
              child: Column(children: [
                Container(
                          height: 90,
                          decoration: BoxDecoration(border:Border(bottom: BorderSide(width: 2, color:Colors.white))), 
                          child:Container(
                            child: Column(children: [ 
                            Row(children: [
                            Image2Buttons(Image2ButtonsVM.back("assets/images/backwhite.png", 0), (type){
                                //back button clicked
                                Navigator.pop(context);
                                this.callback(0);
                            }),
                            TabBar(
                                tabs: [
                                  Tab(icon: Icon(Icons.directions_car), text: "Tab 1",),
                                  Tab(icon: Icon(Icons.directions_transit), text: "Tab 2"),
                                ],
                            )
                          ],),
                          ])
                          )
                ,),
              ]
            ,),), 
            // automaticallyImplyLeading: false,
          );
    }
}

class Design2HeaderVM{
  Color bgColor=ColorsService.instance.primaryColor();
}