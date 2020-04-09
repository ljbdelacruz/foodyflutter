import 'package:floating_search_bar/floating_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:foody/methodinterface/widget.interface.dart';
class SearchListProductSubUI extends StatelessWidget {
  final GetStringData searchBarChange;
  final SearchListProductSubUIVM vm;
  SearchListProductSubUI(this.vm, this.searchBarChange);
  @override
  Widget build(BuildContext context) {
    return FloatingSearchBar.builder(
        itemCount: 0,
        itemBuilder: (BuildContext context, int index) {
          return Text("");
        },
        trailing: CircleAvatar(
          child: Text(vm.initialUser),
        ),
        onChanged: (String value) {
          this.searchBarChange(value);
        },
        onTap: () {},
        decoration: InputDecoration.collapsed(
          hintText: vm.hintText,
        ),
      );
  }
}


class SearchListProductSubUIVM{
  String hintText;
  String initialUser;
  Color dividerC=Colors.white;
  SearchListProductSubUIVM(this.hintText, this.initialUser);
}