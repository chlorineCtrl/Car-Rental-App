import 'package:flutter/material.dart';

class VehicleInformationProvider with ChangeNotifier {
  String _vehicleType = '';
  String _vehicleModel = '';

  String get vehicleType => _vehicleType;
  String get vehicleModel => _vehicleModel;

  void updateVehicleInformation({
    required String vehicleType,
    required String vehicleModel,
  }) {
    _vehicleType = vehicleType;
    _vehicleModel = vehicleModel;
    notifyListeners();
  }
}
