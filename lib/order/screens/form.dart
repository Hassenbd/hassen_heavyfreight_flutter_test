import 'package:flutter/material.dart';
import 'package:hassen_heavyfreight_flutter_test/order/models/pack.dart';
import 'package:hassen_heavyfreight_flutter_test/order/models/package.dart';
import 'package:hassen_heavyfreight_flutter_test/order/widgets/address-section.dart';
import 'package:hassen_heavyfreight_flutter_test/order/widgets/card.dart';
import 'package:hassen_heavyfreight_flutter_test/order/widgets/delivery-pack.dart';

class FormPackage extends StatefulWidget {
  const FormPackage({super.key});
  static String route = "/add_order";

  @override
  State<FormPackage> createState() => _FormPackageState();
}

class _FormPackageState extends State<FormPackage> {
  final _formKey = GlobalKey<FormState>();
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
        backgroundColor: const Color.fromARGB(255, 116, 50, 45),
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: Icon(Icons.arrow_back, color: Colors.black),
          title: Text(
            "New Delivery",
            style: TextStyle(color: Colors.black),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Center(
                child: Text(
                  "HeavyFreight",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
        body: Form(
          key: _formKey,
          child: SafeArea(
            child: ListView(
              children: [
                AddressSection(),
                Container(
                  padding: EdgeInsets.all(18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Package Size",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 23)),
                      SizedBox(
                        height: 200,
                        child: ListView(
                          padding: EdgeInsets.all(12),
                          scrollDirection: Axis.horizontal,
                          children: [
                            ...packages.map((p) {
                              return Padding(
                                padding: const EdgeInsets.all(0),
                                child: SelectableCard(
                                    path: p.image,
                                    title: p.title,
                                    type: p.type,
                                    onSelected: p.selected,
                                    onTap: () {
                                      p.selected = true;
                                      setState(() {});
                                    }),
                              );
                            })
                          ],
                        ),
                      ),
                      const Text("Delivery Packs",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 23)),
                      const SizedBox(height: 16),
                      ...packs.map((p) => Padding(
                            padding: const EdgeInsets.only(
                                bottom: 12), // espace entre les packs
                            child: DeliveryPack(pack: p),
                          )),
                      const SizedBox(height: 24),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.white,
                            padding: EdgeInsets.symmetric(vertical: 16),
                          ),
                          onPressed: () {},
                          child: const Text("Continue",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17)),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
