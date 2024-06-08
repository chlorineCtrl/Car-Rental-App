import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/vehicle_information_provider.dart';

class VehicleInformationPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _vehicleTypeController = TextEditingController();
  final _vehicleModelController = TextEditingController();

  VehicleInformationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Vehicle Information')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _vehicleTypeController,
                decoration: InputDecoration(labelText: 'Vehicle Type'),
              ),
              // Add other form field for vehicle model
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Provider.of<VehicleInformationProvider>(context,
                            listen: false)
                        .updateVehicleInformation(
                      vehicleType: _vehicleTypeController.text,
                      vehicleModel: _vehicleModelController.text,
                    );
                    Navigator.pushNamed(context, '/additional-charges');
                  }
                },
                child: Text('Next'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
