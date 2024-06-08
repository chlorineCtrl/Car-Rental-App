import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Import your provider classes
import 'providers/reservation_provider.dart';
import 'providers/customer_information_provider.dart'; // Add this line
import 'providers/vehicle_information_provider.dart'; // Add this line
import 'providers/additional_charges_provider.dart'; // Add this line

// Import your screen widgets
import 'screens/reservation_details.dart';
import 'screens/customer_information.dart';
import 'screens/vehicle_information.dart';
import 'screens/additional_charges.dart';
import 'screens/detail_show.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ReservationProvider()),
        // Add other providers here
        ChangeNotifierProvider(
            create: (context) => CustomerInformationProvider()),
        ChangeNotifierProvider(
            create: (context) => VehicleInformationProvider()),
        ChangeNotifierProvider(
            create: (context) => AdditionalChargesProvider()),
      ],
      child: MaterialApp(
        title: 'Reservation App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const ReservationDetailsPage(),
          '/customer-info': (context) => CustomerInformationPage(),
          '/vehicle-info': (context) => VehicleInformationPage(),
          '/additional-charges': (context) => AdditionalChargesPage(),
          '/detail-show': (context) => DetailShowPage(),
        },
      ),
    );
  }
}
