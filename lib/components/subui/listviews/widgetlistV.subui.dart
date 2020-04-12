import 'package:flutter/material.dart';

class WidgetlistVSubUI extends StatelessWidget {
  final WidgetlistVSubUIVM vm;
  WidgetlistVSubUI(this.vm);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
                          controller: vm._scrollController,
                          // reverse: true,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: vm.childList,
                          )
    );
  }
}
class WidgetlistVSubUIVM{
  ScrollController _scrollController = ScrollController();
  var childList = <Widget>[];



}



