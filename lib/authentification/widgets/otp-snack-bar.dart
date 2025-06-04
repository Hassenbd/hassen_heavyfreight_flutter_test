import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hassen_heavyfreight_flutter_test/order/screens/form.dart';
import 'package:pinput/pinput.dart';

class OtpSnackBar {
  static void show(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(fontSize: 22, color: Colors.black),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
    );

    bool isEmpty = true;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        behavior: SnackBarBehavior.fixed,
        duration: const Duration(days: 1),
        content: StatefulBuilder(
          builder: (context, setState) {
            return SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_downward, color: Colors.red),
                      onPressed: () {
                        ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      },
                    ),
                  ),
                  const Text(
                    "OTP Verification",
                    style: TextStyle(
                      fontSize: 40,
                      color: Color.fromARGB(255, 5, 30, 50),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(24.0),
                    child: Text(
                      "Please write the OTP code that we send to your registered Email to complete your verification",
                      style: TextStyle(color: Colors.grey),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Pinput(
                    length: 4,
                    defaultPinTheme: defaultPinTheme.copyWith(
                      decoration: defaultPinTheme.decoration!.copyWith(
                        border: Border.all(
                          color: const Color.fromARGB(255, 189, 60, 60),
                        ),
                      ),
                    ),
                    onCompleted: (value) {
                      setState(() {
                        isEmpty = false;
                      });
                    },
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "Remaining Time:",
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                      SizedBox(width: 8),
                      Text(
                        "01:23",
                        style: TextStyle(color: Colors.red),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 244, 117, 54),
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(vertical: 16),
                        ),
                        onPressed: isEmpty
                            ? null
                            : () {
                                ScaffoldMessenger.of(context)
                                    .hideCurrentSnackBar();
                                context.push(FormPackage.route);
                              },
                        child: const Text("Verify"),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Didn't receive a code ?",
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Resend",
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
