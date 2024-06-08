import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/reservation_provider.dart';
import '../models/reservation.dart';

class ReservationDetailsPage extends StatefulWidget {
  const ReservationDetailsPage({super.key});

  @override
  ReservationDetailsPageState createState() => ReservationDetailsPageState();
}

class ReservationDetailsPageState extends State<ReservationDetailsPage> {
  final _formKey = GlobalKey<FormState>();
  final _reservationIdController = TextEditingController();
  final DateTime _pickupDate = DateTime.now();
  final DateTime _returnDate = DateTime.now().add(const Duration(days: 1));
  final int _duration = 1;
  final double _discount = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Reservation Details')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _reservationIdController,
                decoration: const InputDecoration(labelText: 'Reservation ID'),
              ),
              // Add other form fields for pickup date, return date, duration, and discount
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Provider.of<ReservationProvider>(context, listen: false)
                        .updateReservation(
                      Reservation(
                        reservationId: _reservationIdController.text,
                        pickupDate: _pickupDate,
                        returnDate: _returnDate,
                        duration: _duration,
                        discount: _discount,
                      ),
                    );
                    Navigator.pushNamed(context, '/customer-info');
                  }
                },
                child: const Text('Next'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
