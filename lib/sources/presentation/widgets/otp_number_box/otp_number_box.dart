import 'package:lgs_revpro/sources/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class OtpNumberBox extends StatefulWidget {
  const OtpNumberBox({super.key});

  @override
  State<OtpNumberBox> createState() => _OtpNumberBoxState();
}

class _OtpNumberBoxState extends State<OtpNumberBox> {
  String code = "";
  int numDigitType = 6;
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          NumberKey(keyboardNumber: code.isNotEmpty ? code.substring(0, 1) : ""),
          NumberKey(keyboardNumber: code.length > 1 ? code.substring(1, 2) : ""),
          NumberKey(keyboardNumber: code.length > 2 ? code.substring(2, 3) : ""),
          NumberKey(keyboardNumber: code.length > 3 ? code.substring(3, 4) : ""),
          NumberKey(keyboardNumber: code.length > 4 ? code.substring(4, 5) : ""),
          NumberKey(keyboardNumber: code.length > 5 ? code.substring(5, 6) : ""),
        ],
      ),
    );
  }
}
