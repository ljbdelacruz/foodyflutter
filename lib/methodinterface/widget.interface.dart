import 'package:flutter/widgets.dart';
import 'package:foody/model/cart.model.dart';
import 'package:foody/model/category.model.dart';
import 'package:foody/model/imagestorage.model.dart';
import 'package:foody/model/product.model.dart';
import 'package:foody/model/users.model.dart';
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

typedef GetUserModelData(UsersModel data);
typedef GetProductItemData(ProductItemModel data);
typedef GetListProductItemData(List<ProductItemModel> data);

typedef GetCategoryModelData(CategoryModel data);
typedef GetListCategoryModelData(List<CategoryModel> data);


typedef GetImageStorageData(ImageStorageModel data);
typedef GetListImageStorageData(List<ImageStorageModel> data);

typedef GetCartModelData(CartModel data);
typedef GetListCartModelData(List<CartModel> data);
typedef GetCartItemModelData(CartItemModel data);
typedef GetListCartItemModelData(List<CartItemModel> data);

