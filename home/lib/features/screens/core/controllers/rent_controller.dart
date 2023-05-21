import 'package:get/get.dart';
import 'package:home/features/screens/authentication/models/rent_model.dart';
import 'package:home/repository/rent_repository/rent_repository.dart';

class RentController extends GetxController {
  static RentController get instance => Get.find();

  final _rentRepo = Get.put(RentRepository());

  Future<List<RentModel>> getAllRent() async {
    return await _rentRepo.getAllRentDetails();
  }

  Future<void> addRent(RentModel rent) async {
    await _rentRepo.addRent(rent);
  }
}
