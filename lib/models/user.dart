import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:untitled/models/cart_item.dart';

class UserModel {
  static const ID = "id";
  static const NAME = "name";
  static const EMAIL = "email";
  static const CART = "cart";

   String id;
   String name;
   String email;
   List<CartItemModel> cart;

  UserModel({this.id, this.name, this.email, this.cart});

  UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    name = snapshot.data()[NAME];
    email = snapshot.data()[EMAIL];
    id = snapshot.data()[ID];
    cart = _convertCartItems(snapshot.data()[CART] ?? []);
  }

  List<CartItemModel> _convertCartItems(List cartFomDb){
    List<CartItemModel> _result = [];
    if(cartFomDb.length > 0){
      print(cartFomDb);
      cartFomDb.forEach((element) {
      _result.add(CartItemModel.fromMap(element));
    });
    }
    final ids = _result.map((e) => e.id).toSet();
    _result.retainWhere((x) => ids.remove(x.id));
    _result.sort((a, b) => a.id.compareTo(b.id));
    return _result;
  }

  List cartItemsToJson() => cart.map((item) => item.toJson()).toList();
}