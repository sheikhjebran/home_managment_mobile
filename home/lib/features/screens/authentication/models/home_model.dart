import 'package:cloud_firestore/cloud_firestore.dart';

class HomeModel {
  final String? id;
  final String homeLocation;
  final String homeFloor;
  final double homeRent;
  final double homePaintingCharges;
  final double homeAdvance;
  final String homeNotes;
  final String homeAddress;

  const HomeModel({
    this.id,
    required this.homeLocation,
    required this.homeFloor,
    required this.homeRent,
    required this.homePaintingCharges,
    required this.homeAdvance,
    required this.homeNotes,
    required this.homeAddress,
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    return HomeModel(
      id: json['id'],
      homeLocation: json["HomeLocation"],
      homeFloor: json["HomeFloor"],
      homeRent: json["HomeRent"],
      homePaintingCharges: json["HomePaintingCharges"],
      homeAdvance: json["HomeAdvance"],
      homeNotes: json["HomeNotes"],
      homeAddress: json["HomeAddress"],
    );
  }

  toJson() {
    return {
      "HomeLocation": homeLocation,
      "HomeFloor": homeFloor,
      "HomeRent": homeRent,
      "HomePaintingCharges": homePaintingCharges,
      "HomeAdvance": homeAdvance,
      "HomeNotes": homeNotes,
      "HomeAddress": homeAddress,
    };
  }

  factory HomeModel.fromSnapShot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;

    return HomeModel(
      id: document.id,
      homeLocation: data["HomeLocation"],
      homeFloor: data["HomeFloor"],
      homeRent: data["HomeRent"],
      homePaintingCharges: data["HomePaintingCharges"],
      homeAdvance: data["HomeAdvance"],
      homeNotes: data["HomeNotes"],
      homeAddress: data["HomeAddress"],
    );
  }
}
