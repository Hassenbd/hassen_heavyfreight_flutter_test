import 'package:flutter/material.dart';
import 'package:hassen_heavyfreight_flutter_test/order/widgets/address-row.dart';

class AddressSection extends StatelessWidget {
  const AddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(32),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(42),
              bottomRight: Radius.circular(42))),
      child: Column(
        children: [
          AddressRow(
              address: "Gabes 6011, Cite zouhour",
              label: "From",
              dotColor: Colors.green),
          const SizedBox(height: 10),
          AddressRow(
              label: "To",
              address: "Tunis 4021, Cite olympique",
              dotColor: Colors.orange),
        ],
      ),
    );
  }
}
