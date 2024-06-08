import 'package:flutter/material.dart';
import '../models/vehicle.dart'; // Import the VehicleInformation model

class VehicleInformationProvider with ChangeNotifier {
  VehicleInformation _vehicleInformation =
      VehicleInformation(vehicleType: '', vehicleModel: '');

  VehicleInformation get vehicleInformation => _vehicleInformation;

  void updateVehicleInformation(VehicleInformation newVehicleInfo) {
    _vehicleInformation = newVehicleInfo;
    notifyListeners();
  }
}
