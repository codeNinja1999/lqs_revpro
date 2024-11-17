import 'package:flutter/material.dart';
import 'package:lgs_revpro/sources/resources/resources.dart';

class CustomCheckbox extends StatefulWidget {
  const CustomCheckbox({
    super.key,
  });

  @override
  State<CustomCheckbox> createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  bool checkboxValue = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              checkboxValue = !checkboxValue;
            });
          },
          child: checkboxValue
              ? Image.asset(AppImages.check)
              : Icon(
                  Icons.radio_button_unchecked,
                  color: Colors.grey,
                  size: 20,
                ),
        ),
        // SizedBox(width: 5),
        // widget.child,
      ],
    );
  }
}
