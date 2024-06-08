import 'package:flutter/material.dart';

class AdditionalChargesProvider with ChangeNotifier {
  bool _collisionDamage = false;
  bool _rentalTax = false;

  bool get collisionDamage => _collisionDamage;
  bool get rentalTax => _rentalTax;

  void updateAdditionalCharges({
    required bool collisionDamage,
    required bool rentalTax,
  }) {
    _collisionDamage = collisionDamage;
    _rentalTax = rentalTax;
    notifyListeners();
  }
}
