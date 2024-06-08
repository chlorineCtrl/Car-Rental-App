import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/reservation_provider.dart';
import '../providers/customer_information_provider.dart';
import '../providers/additional_charges_provider.dart';

class DetailShowPage extends StatelessWidget {
  const DetailShowPage({Key? key});

  @override
  Widget build(BuildContext context) {
    final reservation = Provider.of<ReservationProvider>(context).reservation;
    final customerInfo = Provider.of<CustomerInformationProvider>(context);
    final additionalCharges = Provider.of<AdditionalChargesProvider>(context);

    // Retrieve vehicle type, model, and rates from arguments
    final Map<String, dynamic> args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final String vehicleType = args['vehicleType'];
    final String vehicleModel = args['vehicleModel'];
    final int hourlyRate = args['hourlyRate'];
    final int dailyRate = args['dailyRate'];
    final int weeklyRate = args['weeklyRate'];

    return Scaffold(
      appBar: AppBar(title: const Text('Reservation Transcript')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Reservation ID: ${reservation.reservationId}'),
            Text('Pickup Date: ${reservation.pickupDate.toString()}'),
            Text('Return Date: ${reservation.returnDate.toString()}'),
            Text('Duration: ${reservation.duration.toString()} days'),
            Text('Discount: ${reservation.discount.toString()}'),

            // Additional customer information
            Text('First Name: ${customerInfo.firstName}'),
            Text('Last Name: ${customerInfo.lastName}'),
            Text('Email: ${customerInfo.email}'),
            Text('Phone: ${customerInfo.phone}'),

            // Vehicle information from arguments
            Text('Vehicle Type: $vehicleType'),
            Text('Vehicle Model: $vehicleModel'),

            // Display hourly, daily, and weekly rates
            Text('Hourly Rate: \$${hourlyRate.toStringAsFixed(2)}'),
            Text('Daily Rate: \$${dailyRate.toStringAsFixed(2)}'),
            Text('Weekly Rate: \$${weeklyRate.toStringAsFixed(2)}'),

            // Additional charges
            Text(
                'Collision Damage: ${additionalCharges.collisionDamage ? 'Yes' : 'No'}'),
            Text('Rental Tax: ${additionalCharges.rentalTax ? 'Yes' : 'No'}'),

            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Go back to the previous screen
              },
              child: const Text('Back'),
            ),
          ],
        ),
      ),
    );
  }
}
