import 'package:flutter/material.dart';
import 'package:hassen_heavyfreight_flutter_test/order/models/pack.dart';

class DeliveryPack extends StatelessWidget {
  final Pack pack;
  const DeliveryPack({super.key, required this.pack});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(pack.type.name),
                    Text(" ${pack.duration} Days shipping"),
                  ],
                ),
                Text(
                  "${pack.amount} DT",
                  style: TextStyle(color: Colors.red),
                )
              ],
            )),
      ),
    );
  }
}
