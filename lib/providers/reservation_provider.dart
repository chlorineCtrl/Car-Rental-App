import 'package:flutter/material.dart';
import '../models/reservation.dart';

class ReservationProvider with ChangeNotifier {
  final Reservation _reservation = Reservation(
    pickupDate: DateTime.now(),
    returnDate: DateTime.now().add(const Duration(days: 1)),
    duration: 1,
    discount: 0.0,
  );

  Reservation get reservation => _reservation;

  void updateReservation(
    Reservation reservation, {
    String? reservationId,
    DateTime? pickupDate,
    DateTime? returnDate,
    int? duration,
    double? discount,
  }) {
    // Update only the provided fields
    if (reservationId != null) {
      _reservation.reservationId = reservationId;
    }
    if (pickupDate != null) {
      _reservation.pickupDate = pickupDate;
    }
    if (returnDate != null) {
      _reservation.returnDate = returnDate;
    }
    if (duration != null) {
      _reservation.duration = duration;
    }
    if (discount != null) {
      _reservation.discount = discount;
    }

    notifyListeners();
  }
}
