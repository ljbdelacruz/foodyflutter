import 'package:flutter/material.dart';
import 'package:foody/components/header/design2.header.dart';
import 'package:foody/config/Constants.config.dart';
import 'package:foody/services/Color.service.dart';


class ActivityPage extends StatefulWidget{
  final ActivityPageVM vm=ActivityPageVM();
  ActivityPage();
  @override
  ActivityPageState createState() => ActivityPageState();
}
class ActivityPageState extends State<ActivityPage> {
  @override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor:ColorsService.instance.primaryColor(),
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.directions_car), text: "Activities",),
                Tab(icon: Icon(Icons.shopping_basket), text: "Delivery"),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Center( child: Text("Activity Page")),
              Center( child: Text("Delivery Page")),
            ],
          ),
        ),
      );
  }
}

class ActivityPageVM{
  Design2HeaderVM header;
  ActivityPageVM(){
    this.header=Design2HeaderVM();
  }

}