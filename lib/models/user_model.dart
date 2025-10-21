import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String name;
  String email;
  String image;
  bool isAdmin;
  String phone;
  String gender;
  String address;
  String documentId;
  DateTime birthday;
  DateTime dateCreate;
  DateTime dateUpdate;
  DocumentReference? id;
  double priceSubscription;
  String addressDescription;
  DateTime? dateSubscription;

  UserModel({
    this.id,
    required this.name,
    required this.image,
    required this.email,
    required this.phone,
    required this.gender,
    required this.isAdmin,
    this.dateSubscription,
    required this.address,
    required this.birthday,
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
        gender: json["gender"] ?? "",
        address: json["address"] ?? "",
        isAdmin: json["isAdmin"] ?? false,
        documentId: json["documentId"] ?? "",
        priceSubscription: json["price_subscription"] ?? 0.0,
        dateSubscription: json["date_subscription"]?.toDate(),
        addressDescription: json["address_description"] ?? "",
        birthday: json["birthday"]?.toDate() ?? DateTime.now(),
        dateUpdate: json["date_update"]?.toDate() ?? DateTime.now(),
        dateCreate: json["date_create"]?.toDate() ?? DateTime.now(),
      );

  factory UserModel.init() => UserModel(
        name: "",
        image: "",
        email: "",
        phone: "",
        gender: "",
        address: "",
        isAdmin: false,
        documentId: "",
        priceSubscription: 0.0,
        dateSubscription: null,
        addressDescription: "",
        birthday: DateTime.now(),
        dateCreate: DateTime.now(),
        dateUpdate: DateTime.now(),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "image": image,
        "phone": phone,
        "gender": gender,
        "address": address,
        "isAdmin": isAdmin,
        "birthday": birthday,
        "documentId": documentId,
        "date_create": dateCreate,
        "date_update": dateUpdate,
        "date_subscription": dateSubscription,
        "price_subscription": priceSubscription,
        "address_description": addressDescription,
      };

  Map<String, dynamic> toJsonUpdate() => {
        "name": name,
        "email": email,
        "phone": phone,
        "gender": gender,
        "isAdmin": isAdmin,
        "address": address,
        "birthday": birthday,
        "documentId": documentId,
        "date_update": dateUpdate,
        "date_subscription": dateSubscription,
        "price_subscription": priceSubscription,
        "address_description": addressDescription,
      };

  UserModel copyWith({
    String? name,
    String? email,
    String? image,
    String? phone,
    bool? isAdmin,
    String? gender,
    String? address,
    String? documentId,
    DateTime? birthday,
    DateTime? dateCreate,
    DateTime? dateUpdate,
    DocumentReference? id,
    double? priceSubscription,
    DateTime? dateSubscription,
    String? addressDescription,
  }) =>
      UserModel(
        id: id ?? this.id,
        name: name ?? this.name,
        image: image ?? this.image,
        phone: phone ?? this.phone,
        email: email ?? this.email,
        gender: gender ?? this.gender,
        isAdmin: isAdmin ?? this.isAdmin,
        address: address ?? this.address,
        birthday: birthday ?? this.birthday,
        dateUpdate: dateUpdate ?? this.dateUpdate,
        documentId: documentId ?? this.documentId,
        dateCreate: dateCreate ?? this.dateCreate,
        dateSubscription: dateSubscription ?? this.dateSubscription,
        priceSubscription: priceSubscription ?? this.priceSubscription,
        addressDescription: addressDescription ?? this.addressDescription,
      );
}
