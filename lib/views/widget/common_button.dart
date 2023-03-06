import 'package:flutter/material.dart';

class CommonButton extends StatefulWidget {
  const CommonButton({super.key});

  @override
  State<CommonButton> createState() => _CommonButtonState();
}

class _CommonButtonState extends State<CommonButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 100,
        color: Colors.amber,
        width: 100,
        alignment: Alignment.center,
        child: Text("data"),
      ),
    );
  }
}
