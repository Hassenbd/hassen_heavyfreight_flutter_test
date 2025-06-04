import 'package:flutter/material.dart';
import 'package:hassen_heavyfreight_flutter_test/authentification/widgets/otp-snack-bar.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class Login extends StatefulWidget {
  const Login({super.key});
  static String route = "/login";

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isValide = false;
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color.fromARGB(255, 116, 50, 45),
      body: ListView(
        padding: EdgeInsets.all(12),
        children: [
          Center(
            child: const Text(
              "HeavyFreight",
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
              ),
            ),
          ),
          Center(
            child: const Text(
              "TRANSPORTATIONS",
              style: TextStyle(color: Colors.red),
            ),
          ),
          SizedBox(height: screenHeight * 0.35),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: const Color.fromARGB(255, 221, 192, 190),
                  ),
                  child: InternationalPhoneNumberInput(
                    initialValue: PhoneNumber(isoCode: 'TN'),
                    onInputChanged: (value) {},
                    formatInput: false,
                    keyboardType: const TextInputType.numberWithOptions(
                        signed: true, decimal: true),
                    selectorConfig: const SelectorConfig(
                      selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                    ),
                    onInputValidated: (value) {
                      isValide = value;
                      setState(() {});
                    },
                    autoValidateMode: AutovalidateMode.onUserInteraction,
                    inputDecoration: const InputDecoration(
                      labelText: "Enter your mobile number",
                      border: InputBorder.none,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    onPressed: isValide
                        ? () {
                            OtpSnackBar.show(context);
                          }
                        : null,
                    child: const Text("Send Code"),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    ));
  }
}
