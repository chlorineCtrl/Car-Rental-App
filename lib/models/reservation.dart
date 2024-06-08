class Reservation {
  String reservationId;
  DateTime pickupDate; // Required parameter
  DateTime returnDate;
  int duration;
  double discount;
  String firstName;
  String lastName;
  String email;
  String phone;
  String vehicleType;
  String vehicleModel;
  bool collisionDamage;
  bool rentalTax;

  Reservation({
    this.reservationId = '',
    required this.pickupDate, // Required parameter
    required this.returnDate,
    this.duration = 0,
    this.discount = 0.0,
    this.firstName = '',
    this.lastName = '',
    this.email = '',
    this.phone = '',
    this.vehicleType = '',
    this.vehicleModel = '',
    this.collisionDamage = false,
    this.rentalTax = false,
  });
}
