


import 'package:foody/model/product.model.dart';
import 'package:foody/services/verifier.service.dart';

class CartModel{
  String id;
  String description;
  String ownerUUID;
  double totalAmount;
  String orderStatus;
  String updatedAt;

  CartModel.json(dynamic data){
    this.id=VerifierService.instance.validateString(data["id"]);
    this.description=VerifierService.instance.validateString(data["description"]);
    this.ownerUUID=VerifierService.instance.validateString(data["ownerUUID"]);
    this.totalAmount=VerifierService.instance.validateDouble(data["totalAmount"]);
    this.orderStatus=VerifierService.instance.validateString(data["orderStatus"]);
    this.updatedAt=VerifierService.instance.validateString(data["updatedAt"]);
  }

  List<CartItemModel> items= [];
  CartModel();
  appendItem(ProductItemModel model, quantity){
    this.items.add(CartItemModel.setup(model, quantity));
  }

}
class CartItemModel{
  String id;
  String description;
  String prodId;
  String cartUUID;
  String storeUUID;
  int quantity = 0;
  double amount;
  String orderStatus;

  CartItemModel.json(dynamic data){
    this.id=VerifierService.instance.validateString(data["id"]);
    this.description=VerifierService.instance.validateString(data["desc"]);
    this.prodId=VerifierService.instance.validateString(data["prodId"]);
    this.cartUUID=VerifierService.instance.validateString(data["cartUUID"]);
    this.storeUUID=VerifierService.instance.validateString(data["storeUUID"]);
    this.quantity=VerifierService.instance.validateInt(data["quantity"]);
    this.amount=VerifierService.instance.validateDouble(data["amount"]);
    this.orderStatus=VerifierService.instance.validateString(data["orderStatus"]);
  }


  ProductItemModel product; 
  CartItemModel.setup(this.product, this.quantity);
}

class CartParam{
  String desc;
  String prodId;
  String ownerId;
  String totalAmount;

  String cartUUID;
  String storeUUID;
  int quantity;
  double amount;
  String orderStatus;

  CartParam.toNewCart(this.desc, this.prodId, this.ownerId, this.totalAmount);
  Map<String, dynamic> toNewCartParam(){
    return {"desc":this.desc, "prodId":this.prodId, "ownerId":this.ownerId, "totalAmount":this.totalAmount};
  }
  CartParam.toNewCartItem(this.desc, this.prodId, this.cartUUID, this.storeUUID, this.quantity, this.amount, this.orderStatus);
  Map<String, dynamic> toNewCartItem(){
    return {"desc":this.desc, "prodId":this.prodId, "cartUUID":this.cartUUID, "storeUUID":this.storeUUID, "quantity":this.quantity, "amount":this.amount, "orderStatus":this.orderStatus};
  }

}