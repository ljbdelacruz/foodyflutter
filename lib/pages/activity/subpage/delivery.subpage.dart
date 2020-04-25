import 'package:flutter/material.dart';
class DeliverySubPage extends StatelessWidget {
  final DeliverySubPageVM vm;
  DeliverySubPage(this.vm);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child:Column(children: [
        Text("Delivery Sub Page")
      ]
    )) ;      
  }
}
class DeliverySubPageVM{
  DeliverySubPageVM();
}

