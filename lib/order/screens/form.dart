import 'package:flutter/material.dart';
import 'package:hassen_heavyfreight_flutter_test/order/models/pack.dart';
import 'package:hassen_heavyfreight_flutter_test/order/models/package.dart';
import 'package:hassen_heavyfreight_flutter_test/order/widgets/card.dart';
import 'package:hassen_heavyfreight_flutter_test/order/widgets/delivery-pack.dart';

class FormPackage extends StatelessWidget {
  const FormPackage({super.key});
  static String route = "/add_order";

  @override
  Widget build(BuildContext context) {
    final List<Package> packages = [
      Package(
          id: '1',
          title: '< 5 kg',
          type: TypePackage.small,
          image: 'images/small.png'),
      Package(
          id: '3',
          title: '5-20 kg',
          type: TypePackage.medium,
          image: 'images/medium.png'),
      Package(
          id: '3',
          title: '> 20 kg',
          type: TypePackage.large,
          image: 'images/large.png'),
    ];
    final List<Pack> packs = [
      Pack(amount: 23, type: TypePack.Standard, duration: "3-2"),
      Pack(amount: 32, type: TypePack.fast, duration: "1")
    ];

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: Icon(Icons.arrow_back, color: Colors.black),
          title: Text("New Delivery"),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                spacing: 25,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Package Size"),
                  SizedBox(
                    height: 200,
                    child: ListView(
                      padding: EdgeInsets.all(12),
                      scrollDirection: Axis.horizontal,
                      children: [
                        ...packages.map((p) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SelectableCard(
                                path: p.image,
                                title: p.title,
                                type: p.type,
                                onSelected: false,
                                onTap: () {}),
                          );
                        })
                      ],
                    ),
                  ),
                  Text("Delivery Packs"),
                  ...packs.map((p) {
                    return DeliveryPack(pack: p);
                  }),
                  SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(vertical: 16),
                        ),
                        onPressed: () {},
                        child: const Text("Continue"),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
