import 'package:flutter/material.dart';
import 'package:foody/components/header/design3.header.dart';
import 'package:foody/components/subui/listviews/chatlist.subui.dart';
import 'package:foody/components/subui/listviews/chatroomlist.subui.dart';
import 'package:foody/config/Constants.config.dart';
import 'package:foody/services/navigator.service.dart';


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
                          Container(child:Column(
                              children: [
                                ChatRoomListSubUI(widget.vm.chatListVM, (index){
                                  NavigatorService.instance.toChatPage(context);
                                }, (index, type){
                                  //selected index 
                                  switch(type){
                                    case 0:
                                      //Archive
                                      print("Archiving Index");
                                      print(index);
                                      break;
                                  }
                                })
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
  ChatRoomListSubUIVM chatListVM;
  MessagePageVM(){
    this.header=Design3HeaderVM();
    this.chatListVM=ChatRoomListSubUIVM(400);
  }
}