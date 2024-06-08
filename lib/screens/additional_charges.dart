import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/additional_charges_provider.dart';

class AdditionalChargesPage extends StatelessWidget {
  const AdditionalChargesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Additional Charges')),
      body: Column(
        children: <Widget>[
          // Add checkboxes for additional charges
          ElevatedButton(
            onPressed: () {
              Provider.of<AdditionalChargesProvider>(context, listen: false)
                  .updateAdditionalCharges(
                collisionDamage:
                    true, // Example value, replace with actual checkbox state
                rentalTax:
                    false, // Example value, replace with actual checkbox state
              );
              Navigator.pushNamed(context, '/detail-show');
            },
            child: Text('Next'),
          ),
        ],
      ),
    );
  }
}
