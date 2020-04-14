


import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foody/services/navigator.service.dart';

class SnackBarService{

  static SnackBarService instance=SnackBarService();

  SnackBar showCartSnackBar(BuildContext context, String message){
    return SnackBar(
            content: Text(message),
            action: SnackBarAction(
              label: 'View Cart',
              onPressed: () {
                // Some code to undo the change.
                NavigatorService.instance.toCart(context);
              },
            ),
    );
  }
}