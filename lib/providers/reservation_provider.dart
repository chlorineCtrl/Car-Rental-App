import 'package:flutter/material.dart';
import '../models/reservation.dart';

class ReservationProvider with ChangeNotifier {
  Reservation _reservation = Reservation(
    pickupDate: DateTime.now(),
    returnDate: DateTime.now().add(const Duration(days: 1)),
  );

  Reservation get reservation => _reservation;

  void updateReservation(Reservation newReservation) {
    _reservation = newReservation;
    notifyListeners();
  }
}
