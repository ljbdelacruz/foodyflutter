import 'package:flutter/widgets.dart';
import 'package:foody/services/facebook.service.dart';
import 'package:location/location.dart';

typedef GetStringData= void Function(String data);
typedef GetDateTimeCallback = void Function(DateTime url);
typedef GetIntData(int data);
typedef GetInt2Data(int data, int data2);
typedef GetDynamicData(dynamic data);
typedef NormalCallback();
typedef ContextCallback(BuildContext context);
typedef GetFBuUserInfo(FacebookUserInfo fb);
typedef GetLocationData(LocationData data);