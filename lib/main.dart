import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/reservation_provider.dart';
import 'screens/reservation_details.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ReservationProvider(),
      child: MaterialApp(
        title: 'Reservation App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const ReservationDetailsPage(),
        },
      ),
    );
  }
}
