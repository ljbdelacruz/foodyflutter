import 'package:flutter/material.dart';
import 'package:foody/components/subui/listviews/widget.listview.dart';

class ToPaySubPage extends StatefulWidget{
  final ToPaySubPageVM vm;
  ToPaySubPage(this.vm);
  @override
  ToPaySubPageState createState() => ToPaySubPageState();
}
class ToPaySubPageState extends State<ToPaySubPage> {
  @override
  void initState() {
    super.initState();
  }
  @override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Container(child: Column(children: [
      WidgetlistVSubUI(widget.vm.listToPayVM)
    ],),);
  }
}

class ToPaySubPageVM{
  WidgetlistVSubUIVM listToPayVM;
  ToPaySubPageVM(){
    this.listToPayVM = WidgetlistVSubUIVM();
  }
  
}