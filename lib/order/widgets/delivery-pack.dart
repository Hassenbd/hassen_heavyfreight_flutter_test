import 'package:flutter/material.dart';
import 'package:hassen_heavyfreight_flutter_test/order/models/pack.dart';

class DeliveryPack extends StatelessWidget {
  final Pack pack;
  const DeliveryPack({super.key, required this.pack});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Padding(
        padding: EdgeInsets.all(0),
        child: ElevatedButton(
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      pack.type.name,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    Text(" ${pack.duration} Days shipping"),
                  ],
                ),
                Text(
                  "${pack.amount.toInt()} DT",
                  style: TextStyle(color: Colors.red, fontSize: 17),
                )
              ],
            )),
      ),
    );
  }
}
