// To parse this JSON data, do
//
//     final cart = cartFromJson(jsonString);

import 'dart:convert';

Cart cartFromJson(String str) => Cart.fromJson(json.decode(str));

String cartToJson(Cart data) => json.encode(data.toJson());

class Cart {
    String avatar;
    String name;
    String price;

    Cart({
        required this.avatar,
        required this.name,
        required this.price,
    });

    factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        avatar: json["avatar"],
        name: json["name"],
        price: json["price"],
    );

    Map<String, dynamic> toJson() => {
        "avatar": avatar,
        "name": name,
        "price": price,
    };
}