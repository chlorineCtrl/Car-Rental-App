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
  late DateTime _pickupDate = DateTime.now();
  late DateTime _returnDate = DateTime.now().add(const Duration(days: 1));
  int _duration = 1;
  double _discount = 0.0;

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
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a reservation ID';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      readOnly: true,
                      controller:
                          TextEditingController(text: _pickupDate.toString()),
                      decoration:
                          const InputDecoration(labelText: 'Pickup Date'),
                      onTap: () async {
                        final DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: _pickupDate,
                          firstDate: DateTime.now(),
                          lastDate:
                              DateTime.now().add(const Duration(days: 365)),
                        );
                        if (pickedDate != null && pickedDate != _pickupDate) {
                          setState(() {
                            _pickupDate = pickedDate;
                            _updateDuration();
                          });
                        }
                      },
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: TextFormField(
                      readOnly: true,
                      controller:
                          TextEditingController(text: _returnDate.toString()),
                      decoration:
                          const InputDecoration(labelText: 'Return Date'),
                      onTap: () async {
                        final DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: _returnDate,
                          firstDate: DateTime.now(),
                          lastDate:
                              DateTime.now().add(const Duration(days: 365)),
                        );
                        if (pickedDate != null && pickedDate != _returnDate) {
                          setState(() {
                            _returnDate = pickedDate;
                            _updateDuration();
                          });
                        }
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              TextFormField(
                enabled: false, // Disable editing manually
                initialValue: _duration.toString(),
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Duration (days)'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter duration';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                initialValue: _discount.toString(),
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                decoration: const InputDecoration(labelText: 'Discount'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter discount';
                  }
                  return null;
                },
                onChanged: (value) {
                  // Parse the input value to a double
                  double? discount = double.tryParse(value);
                  if (discount != null) {
                    setState(() {
                      _discount = discount;
                    });
                  }
                },
              ),
              const SizedBox(height: 16),
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
                    Navigator.pushNamed(
                      context,
                      '/customer-info',
                      arguments: {
                        'reservationId': _reservationIdController.text,
                        'pickupDate': _pickupDate,
                        'returnDate': _returnDate,
                        'duration': _duration,
                        'discount': _discount,
                      },
                    );
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

  void _updateDuration() {
    final difference = _returnDate.difference(_pickupDate).inDays;
    setState(() {
      _duration = difference > 0
          ? difference + 1
          : 1; // Adding 1 to include the end date
    });
  }
}
