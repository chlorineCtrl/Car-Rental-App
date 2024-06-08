import 'package:flutter/material.dart';

class CustomerInformationProvider with ChangeNotifier {
  String _firstName = '';
  String _lastName = '';
  String _email = '';
  String _phone = '';

  String get firstName => _firstName;
  String get lastName => _lastName;
  String get email => _email;
  String get phone => _phone;

  void updateCustomerInformation({
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
  }) {
    _firstName = firstName;
    _lastName = lastName;
    _email = email;
    _phone = phone;
    notifyListeners();
  }
}
