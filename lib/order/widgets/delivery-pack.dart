import 'package:flutter/material.dart';
import 'package:hassen_heavyfreight_flutter_test/order/models/pack.dart';

class DeliveryPackField extends StatelessWidget {
  final Pack pack;
  final bool isSelected;
  final VoidCallback onTap;

  const DeliveryPackField({
    Key? key,
    required this.pack,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Padding(
        padding: EdgeInsets.zero,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: isSelected ? Colors.red.shade100 : null,
            side: BorderSide(
              color: isSelected ? Colors.red : Colors.transparent,
              width: 2,
            ),
          ),
          onPressed: onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    pack.type.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text(" ${pack.duration} Days shipping"),
                ],
              ),
              Text(
                "${pack.amount.toInt()} DT",
                style: const TextStyle(color: Colors.red, fontSize: 17),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
