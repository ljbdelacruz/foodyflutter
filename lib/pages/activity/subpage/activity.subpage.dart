import 'package:flutter/material.dart';
class ActivitySubPage extends StatelessWidget {
  final ActivitySubPageVM vm;
  ActivitySubPage(this.vm);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child:Column(children: [
        Text("Activity Sub Page"),
        
      ])
    );      
  }
}

class ActivitySubPageVM{
  ActivitySubPageVM();
}

