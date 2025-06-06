import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hassen_heavyfreight_flutter_test/order/models/package.dart';

class SelectableImageField extends StatelessWidget {
  final String path;
  final String title;
  final TypePackage type;
  final VoidCallback onTap;
  final bool isSelected;
  final double screenWidth;
  final FormFieldValidator<bool>? validator;

  const SelectableImageField({
    super.key,
    required this.path,
    required this.title,
    required this.type,
    required this.onTap,
    required this.isSelected,
    required this.screenWidth,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return FormField<bool>(
      initialValue: isSelected,
      validator: validator,
      builder: (state) {
        return GestureDetector(
          onTap: () {
            onTap(); 
            state.didChange(true); 
          },
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
                color: isSelected ? Colors.red : Colors.transparent,
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
            ),
          ),
        );
      },
    );
  }
}
