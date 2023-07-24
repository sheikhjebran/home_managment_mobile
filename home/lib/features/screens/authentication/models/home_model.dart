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
      homeLocation: data["HomeLocation"].toString(),
      homeFloor: data["HomeFloor"].toString(),
      homeRent: data["HomeRent"].toDouble(),
      homePaintingCharges: data["HomePaintingCharges"].toDouble(),
      homeAdvance: data["HomeAdvance"].toDouble(),
      homeNotes: data["HomeNotes"].toString(),
      homeAddress: data["HomeAddress"].toString(),
    );
  }
}
