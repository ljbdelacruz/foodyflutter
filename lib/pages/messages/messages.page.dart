import 'package:flutter/material.dart';
import 'package:foody/components/header/design3.header.dart';
import 'package:foody/config/Constants.config.dart';


class MessagePage extends StatefulWidget{
  final MessagePageVM vm=MessagePageVM();
  MessagePage();
  @override
  MessagePageState createState() => MessagePageState();
}
class MessagePageState extends State<MessagePage> {
  @override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(

                        color:Constants.instance.themeColor,
                        child: Scaffold(
                        appBar: PreferredSize(child: Design3Header(widget.vm.header, (){
                          //btn clicked
                        }), preferredSize: Size.fromHeight(100)),
                        backgroundColor: Colors.transparent,
                        body: 
                          SingleChildScrollView(child:Column(
                              children: [
                                Text("Chat Page")
                              ]
                          )
                          )
                        ,),
        )
      );
  }
}

class MessagePageVM{
  Design3HeaderVM header;
  MessagePageVM(){
    this.header=Design3HeaderVM();
  }
}