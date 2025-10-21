import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String name;
  String email;
  String image;
  String phone;
  String address;
  String documentId;
  DateTime dateCreate;
  DateTime dateUpdate;
  DocumentReference? id;
  double priceSubscription;
  String addressDescription;

  UserModel({
    this.id,
    required this.name,
    required this.image,
    required this.email,
    required this.phone,
    required this.address,
    required this.documentId,
    required this.dateUpdate,
    required this.dateCreate,
    required this.priceSubscription,
    required this.addressDescription,
  });

  factory UserModel.fromJson(json, DocumentReference id) => UserModel(
        id: id,
        name: json["name"] ?? "",
        email: json["email"] ?? "",
        image: json["image"] ?? "",
        phone: json["phone"] ?? "",
        address: json["address"] ?? "",
        documentId: json["documentId"] ?? "",
        priceSubscription: json["price_subscription"] ?? 0.0,
        dateCreate: json["date_create"].toDate(),
        dateUpdate: json["date_update"].toDate(),
        addressDescription: json["address_description"] ?? "",
      );

  factory UserModel.init() => UserModel(
        name: "",
        image: "",
        email: "",
        phone: "",
        address: "",
        documentId: "",
        priceSubscription: 0.0,
        addressDescription: "",
        dateCreate: DateTime.now(),
        dateUpdate: DateTime.now(),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "image": image,
        "phone": phone,
        "address": address,
        "documentId": documentId,
        "date_create": dateCreate,
        "date_update": dateUpdate,
        "price_subscription": priceSubscription,
        "address_description": addressDescription,
      };

  Map<String, dynamic> toJsonUpdate() => {
        "name": name,
        "email": email,
        "phone": phone,
        "address": address,
        "date_update": dateUpdate,
        "documentId": documentId,
        "price_subscription": priceSubscription,
        "address_description": addressDescription,
      };

  UserModel copyWith({
    String? name,
    String? email,
    String? image,
    String? phone,
    String? address,
    String? documentId,
    DateTime? dateCreate,
    DateTime? dateUpdate,
    DocumentReference? id,
    double? priceSubscription,
    String? addressDescription,
  }) =>
      UserModel(
        id: id ?? this.id,
        name: name ?? this.name,
        image: image ?? this.image,
        email: email ?? this.email,
        phone: phone ?? this.phone,
        address: address ?? this.address,
        dateUpdate: dateUpdate ?? this.dateUpdate,
        documentId: documentId ?? this.documentId,
        dateCreate: dateCreate ?? this.dateCreate,
        priceSubscription: priceSubscription ?? this.priceSubscription,
        addressDescription: addressDescription ?? this.addressDescription,
      );
}
