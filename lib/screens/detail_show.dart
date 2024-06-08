import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/reservation_provider.dart';

class DetailShowPage extends StatelessWidget {
  const DetailShowPage({super.key});

  @override
  Widget build(BuildContext context) {
    final reservation = Provider.of<ReservationProvider>(context).reservation;
    return Scaffold(
      appBar: AppBar(title: const Text('Reservation Details')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Reservation ID: ${reservation.reservationId}'),
            // Display other reservation details
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
