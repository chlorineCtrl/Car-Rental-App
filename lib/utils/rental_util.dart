class RentalUtil {
  static double calculateTotalCharges({
    required int duration,
    required double hourlyRate,
    required double dailyRate,
    required double weeklyRate,
    required double discount,
    required double additionalCharges,
  }) {
    double totalCharges = duration * hourlyRate;
    if (duration >= 24) {
      totalCharges = duration * dailyRate;
    } else if (duration >= 168) {
      totalCharges = duration * weeklyRate;
    }

    totalCharges -= (totalCharges * discount) / 100;
    totalCharges += additionalCharges;

    return totalCharges;
  }
}
