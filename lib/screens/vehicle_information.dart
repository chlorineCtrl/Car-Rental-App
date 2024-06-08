import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/vehicle_information_provider.dart';
import '../models/vehicle.dart'; // Import the VehicleInformation model

class VehicleInformationPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _vehicleTypeController = TextEditingController();
  final _vehicleModelController = TextEditingController();

  VehicleInformationPage({super.key}); // Corrected key argument

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Vehicle Information')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _vehicleTypeController,
                decoration: const InputDecoration(labelText: 'Vehicle Type'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter vehicle type';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _vehicleModelController,
                decoration: const InputDecoration(labelText: 'Vehicle Model'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter vehicle model';
                  }
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Create a VehicleInformation object with form data
                    VehicleInformation vehicleInfo = VehicleInformation(
                      vehicleType: _vehicleTypeController.text,
                      vehicleModel: _vehicleModelController.text,
                    );

                    Provider.of<VehicleInformationProvider>(context,
                            listen: false)
                        .updateVehicleInformation(vehicleInfo);
                    Navigator.pushNamed(context, '/additional-charges');
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
