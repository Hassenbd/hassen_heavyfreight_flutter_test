import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hassen_heavyfreight_flutter_test/order/widgets/input-field.dart';

class DeliveryInfo extends StatefulWidget {
  const DeliveryInfo({super.key});
  static String route = "/delivery-info";

  @override
  State<DeliveryInfo> createState() => _DeliveryInfoState();
}

class _DeliveryInfoState extends State<DeliveryInfo> {
  void _showDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: Colors.white,
          title: Center(
            child: Text(
              "Confirm ?",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          content: Text(
            "Do you want to accept the job?",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
          actionsAlignment: MainAxisAlignment.spaceEvenly,
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepOrange,
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text("Accept", style: TextStyle(color: Colors.white)),
            ),
            OutlinedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: Colors.grey.shade400),
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text("Cancel", style: TextStyle(color: Colors.black)),
            ),
          ],
        );
      },
    );
  }

  bool isRecipient = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () {
            context.pop(context);
          },
        ),
        title: Text(
          "Delivery info",
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
      body: ListView(
        padding: EdgeInsets.all(12),
        children: [
          Stack(children: [
            Container(
              width: double.infinity,
              height: 340,
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(25)),
            ),
            Positioned(
              bottom: 10,
              right: 10,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.my_location, color: Colors.deepOrange),
              ),
            )
          ]),
          const SizedBox(
            height: 17,
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey[200],
                      contentPadding: EdgeInsets.all(2),
                      prefixIcon:
                          Icon(Icons.search, color: Colors.grey.shade500),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide.none),
                      hintStyle: TextStyle(fontSize: 14, color: Colors.black),
                      hintText: "Search Address"),
                ),
                const SizedBox(
                  height: 11,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Add me as recipient",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    Switch(
                      value: isRecipient,
                      onChanged: (val) {
                        setState(() => isRecipient = val);
                      },
                    ),
                  ],
                ),
                InputField(text: "Adress", icon: Icon(Icons.location_on)),
                const SizedBox(
                  height: 10,
                ),
                InputField(text: "Sender name", icon: Icon(Icons.person)),
                const SizedBox(
                  height: 10,
                ),
                InputField(text: "Phone number", icon: Icon(Icons.phone)),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 125,
                  child: ElevatedButton(
                    onPressed: () {
                      _showDialog();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: Text(
                      "Confirm",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
