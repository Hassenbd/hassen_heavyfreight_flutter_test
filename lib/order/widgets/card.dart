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
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: onSelected ? Colors.red : Colors.transparent,
            width: 4,
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Container(
                color: Colors.white,
              ),
              Image.asset(
                path,
                fit: BoxFit.cover, // prend tout l’espace du container
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      type.name,
                      style: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
