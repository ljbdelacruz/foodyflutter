import 'package:flutter/material.dart';
import 'package:foody/components/footer/entermessage.footer.dart';
import 'package:foody/components/header/design3.header.dart';
import 'package:foody/components/subui/listviews/chatlist.subui.dart';
import 'package:foody/config/Constants.config.dart';


class ChatPage extends StatefulWidget{
  final ChatPageVM vm=ChatPageVM();
  ChatPage();
  @override
  ChatPageState createState() => ChatPageState();
}
class ChatPageState extends State<ChatPage> {
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
                                Text("Chat Page"),
                                ChatListSubUI(widget.vm.chatUI, (index){}),
                              ]
                          )
                          ),
                          bottomNavigationBar: EnterMessageFooter(EnterMessageFooterVM(), (msg){
                            setState(() {
                              widget.vm.chatUI.appendSender(msg, "22:40 PM", (index){});
                            });
                          }),
                        ),
        )
      );
  }
}

class ChatPageVM{
  Design3HeaderVM header;
  ChatListSubUIVM chatUI;
  ChatPageVM(){
    this.header=Design3HeaderVM();
    this.chatUI=ChatListSubUIVM();
    this.chatUI.setupDummy((index){
      //
    });
  }
}