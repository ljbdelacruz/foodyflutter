import 'package:flutter/material.dart';
import 'package:flutter_tab_bar_no_ripple/flutter_tab_bar_no_ripple.dart';
import 'package:foody/components/header/design2.header.dart';
import 'package:foody/pages/activity/subpage/activity.subpage.dart';
import 'package:foody/pages/activity/subpage/delivery.subpage.dart';
import 'package:foody/pages/activity/subpage/topay.subpage.dart';


class ActivityPage extends StatefulWidget{
  final ActivityPageVM vm=ActivityPageVM();
  ActivityPage();
  @override
  ActivityPageState createState() => ActivityPageState();
}
class ActivityPageState extends State<ActivityPage> with SingleTickerProviderStateMixin {
  TabController _controller;
  bool _customIndicator = false;
  @override
  void initState() {
    super.initState();
    _controller = TabController(vsync: this, length: _allPages.length);
  }


  @override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: TabBarNoRipple(
          controller: _controller,
          isScrollable: true,
          indicator: getIndicator(),
          tabs: _allPages.map<Tab>((_Page page) {
            return Tab(text: page.text, icon: Icon(page.icon));
          }).toList(),
        ),
      ),
      body: TabBarView(
          controller: _controller,
          children: [
            ToPaySubPage(widget.vm.toPayPageVM),
            Text("To Ship Page"),            
            Text("For Delivery Page"),                        
            Text("To Receive Page"),
            Text("To Rate Page"),
          ]
      )
    );
  }


    Decoration getIndicator() {
    if (!_customIndicator) return const UnderlineTabIndicator();
    return ShapeDecoration(
          shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(4.0)),
                side: BorderSide(
                  color: Colors.white24,
                  width: 2.0,
                ),
              ) +
              const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(4.0)),
                side: BorderSide(
                  color: Colors.transparent,
                  width: 4.0,
                ),
              ),
        );
  }

  List<_Page> _allPages = <_Page>[
  _Page(icon: Icons.payment, text: 'To Pay', index:0),
  _Page(icon: Icons.local_shipping, text: 'To Ship', index:1),
  _Page(icon: Icons.directions_walk, text: 'For Delivery', index:2),
  _Page(icon: Icons.shopping_basket, text: 'To Receive', index:3),
  _Page(icon: Icons.grade, text: 'To Rate', index:4),  
  ];
}

class _Page {
  const _Page({this.icon, this.text, this.index});
  final IconData icon;
  final String text;
  final index;
}




class ActivityPageVM{
  Design2HeaderVM header;
  DeliverySubPageVM deliverySubPageVM;
  ActivitySubPageVM activitySubPageVM;
  ToPaySubPageVM toPayPageVM;

  ActivityPageVM(){
    this.header=Design2HeaderVM();
    this.deliverySubPageVM=DeliverySubPageVM();
    this.activitySubPageVM=ActivitySubPageVM();
    this.toPayPageVM=ToPaySubPageVM();
  }

}