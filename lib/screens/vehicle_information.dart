import 'package:flutter/material.dart';
import '../services/api_service.dart';

class VehicleInformationPage extends StatefulWidget {
  const VehicleInformationPage({Key? key}) : super(key: key);

  @override
  VehicleInformationPageState createState() => VehicleInformationPageState();
}

class VehicleInformationPageState extends State<VehicleInformationPage> {
  final _formKey = GlobalKey<FormState>();
  final _vehicleTypeController = TextEditingController();
  final _vehicleModelController = TextEditingController();
  List<Map<String, dynamic>> _filteredCars = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    // Add listeners to text controllers to trigger search on text change
    _vehicleTypeController.addListener(_search);
    _vehicleModelController.addListener(_search);
  }

  @override
  void dispose() {
    // Remove listeners when the widget is disposed
    _vehicleTypeController.dispose();
    _vehicleModelController.dispose();
    super.dispose();
  }

  void _search() {
    // Perform search whenever something is inputted
    _fetchFilteredCars();
  }

  Future<void> _fetchFilteredCars() async {
    if (!mounted) return; // Check if the widget is still mounted
    setState(() {
      _isLoading = true;
    });
    try {
      final cars = await ApiService.getFilteredCars(
        _vehicleTypeController.text,
        _vehicleModelController.text,
      );
      if (!mounted) return; // Check again before updating state
      setState(() {
        _filteredCars = cars;
        _isLoading = false;
      });
    } catch (e) {
      if (!mounted) return; // Check again before updating state
      setState(() {
        _isLoading = false;
      });
      print('Error fetching filtered cars: $e');
    }
  }

  void _navigateToNextPage(BuildContext context) {
    final String vehicleType = _vehicleTypeController.text;
    final String vehicleModel = _vehicleModelController.text;
    Navigator.of(context).pushNamed(
      '/additional-charges',
      arguments: {
        'vehicleType': vehicleType,
        'vehicleModel': vehicleModel,
      },
    );
  }

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
              _isLoading ? const CircularProgressIndicator() : _buildCarsList(),
              ElevatedButton(
                onPressed: () {
                  _navigateToNextPage(context);
                },
                child: const Text('Next'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCarsList() {
    if (_filteredCars.isEmpty) {
      return const Text('No cars found for the given type and model.');
    } else {
      return Expanded(
        child: ListView.builder(
          itemCount: _filteredCars.length,
          itemBuilder: (context, index) {
            final car = _filteredCars[index];
            return Card(
              margin:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 0.0),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Image.network(
                          car['imageURL'],
                          width: 100,
                          height: 60,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(width: 16.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${car['make']} ${car['model']}',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              '${car['seats']} seats, ${car['bags']} bags',
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 16.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$${car['rates']['hourly']} / Hour',
                          style: const TextStyle(fontSize: 14),
                        ),
                        Text(
                          '\$${car['rates']['daily']} / Day',
                          style: const TextStyle(fontSize: 14),
                        ),
                        Text(
                          '\$${car['rates']['weekly']} / Week',
                          style: const TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      );
    }
  }
}
