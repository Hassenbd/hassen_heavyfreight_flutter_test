import 'package:flutter/material.dart';
import 'package:hassen_heavyfreight_flutter_test/order/models/package.dart';

class SelectableCard extends StatelessWidget {
  final String path;
  final bool onSelected;
  final VoidCallback onTap;
  final String title;
  final TypePackage type;

  const SelectableCard(
      {super.key,
      required this.path,
      required this.title,
      required this.type,
      required this.onTap,
      required this.onSelected});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onTap,
      child: Container(
          width: screenWidth * 0.29,
          height: 150,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(path),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: onSelected ? Colors.red : Colors.transparent,
              width: 4,
            ),
          ),
          child: Column(
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              Text(
                type.name,
                style: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ],
          )),
    );
  }
}
