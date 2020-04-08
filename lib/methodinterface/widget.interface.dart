import 'package:foody/services/facebook.service.dart';
import 'package:location/location.dart';

typedef GetStringData= void Function(String data);
typedef GetDateTimeCallback = void Function(DateTime url);
typedef GetIntData(int data);
typedef GetDynamicData(dynamic data);
typedef NormalCallback();
typedef GetFBuUserInfo(FacebookUserInfo fb);
typedef GetLocationData(LocationData data);