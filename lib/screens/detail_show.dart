import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/reservation_provider.dart';
import '../providers/customer_information_provider.dart';
import '../providers/vehicle_information_provider.dart';
import '../providers/additional_charges_provider.dart';

class DetailShowPage extends StatelessWidget {
  const DetailShowPage({super.key});

  @override
  Widget build(BuildContext context) {
    final reservation = Provider.of<ReservationProvider>(context).reservation;
    final customerInfo = Provider.of<CustomerInformationProvider>(context);
    final vehicleInfo = Provider.of<VehicleInformationProvider>(context);
    final additionalCharges = Provider.of<AdditionalChargesProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Reservation Details')),
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

            // Additional vehicle information
            Text('Vehicle Type: ${vehicleInfo.vehicleInformation.vehicleType}'),
            Text(
                'Vehicle Model: ${vehicleInfo.vehicleInformation.vehicleModel}'),

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
