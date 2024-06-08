import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/additional_charges_provider.dart';

class AdditionalChargesPage extends StatefulWidget {
  const AdditionalChargesPage({super.key});

  @override
  _AdditionalChargesPageState createState() => _AdditionalChargesPageState();
}

class _AdditionalChargesPageState extends State<AdditionalChargesPage> {
  bool _collisionDamage = false;
  bool _rentalTax = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Additional Charges')),
      body: Column(
        children: <Widget>[
          CheckboxListTile(
            title: const Text('Collision Damage'),
            value: _collisionDamage,
            onChanged: (value) {
              setState(() {
                _collisionDamage = value!;
              });
            },
          ),
          CheckboxListTile(
            title: const Text('Rental Tax'),
            value: _rentalTax,
            onChanged: (value) {
              setState(() {
                _rentalTax = value!;
              });
            },
          ),
          ElevatedButton(
            onPressed: () {
              Provider.of<AdditionalChargesProvider>(context, listen: false)
                  .updateAdditionalCharges(
                collisionDamage: _collisionDamage,
                rentalTax: _rentalTax,
              );
              Navigator.pushNamed(context, '/detail-show');
            },
            child: const Text('Next'),
          ),
        ],
      ),
    );
  }
}
