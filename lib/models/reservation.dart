class Reservation {
  String? reservationId;
  late DateTime pickupDate;
  late DateTime returnDate;
  late int duration;
  late double discount;

  Reservation({
    this.reservationId,
    required this.pickupDate,
    required this.returnDate,
    required this.duration,
    required this.discount,
  });
}
