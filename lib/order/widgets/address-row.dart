import 'package:flutter/material.dart';

class AddressRow extends StatelessWidget {
  Color dotColor;
  String label;
  String address;

  AddressRow(
      {super.key,
      required this.address,
      required this.label,
      required this.dotColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.circle, color: dotColor, size: 12),
        const SizedBox(width: 12),
        Expanded(
            child:
                Text("$label\n$address", style: const TextStyle(fontSize: 14))),
        IconButton(
          icon: Icon(Icons.location_searching_outlined),
          onPressed: () {},
        ),
      ],
    );
  }
}
