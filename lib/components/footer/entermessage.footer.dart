import 'package:flutter/material.dart';
import 'package:foody/methodinterface/widget.interface.dart';
import 'package:foody/services/Color.service.dart';

class EnterMessageFooter extends StatelessWidget {
  final GetStringData sendOnClick;
  final EnterMessageFooterVM vm;
  EnterMessageFooter(this.vm, this.sendOnClick);
    @override
    Widget build(BuildContext context) {
      return Container(height:100, 
      color:vm.bgColor,
      child: Column(children:[
          Divider(height: 0, color: Colors.black26),
                  // SizedBox(
                  //   height: 50,
          Container(
                    color: Colors.white,
                    height: 50,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: TextField(
                        maxLines: 20,
                        controller: vm.messageC,
                        decoration: InputDecoration(
                          // contentPadding: const EdgeInsets.symmetric(horizontal: 5.0),
                          suffixIcon: IconButton(
                            icon: Icon(Icons.send),
                            onPressed: () {
                              this.sendOnClick(vm.messageC.text);
                              FocusScope.of(context).requestFocus(FocusNode());
                            },
                          ),
                          border: InputBorder.none,
                          hintText: "enter your message",
                        ),
                      ),
                    ),
          ),
      ])
      );
    }
}

class EnterMessageFooterVM{
  Color bgColor=ColorsService.instance.primaryColor();
  TextEditingController messageC=TextEditingController();
}