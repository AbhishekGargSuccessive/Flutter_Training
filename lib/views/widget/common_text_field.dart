
import 'package:flutter/material.dart';
import '../../core/constant/string_constants.dart';

class CommonTextField extends StatefulWidget {
  const CommonTextField({super.key});

  @override
  State<CommonTextField> createState() => _CommonTextFieldState();
}

class _CommonTextFieldState extends State<CommonTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Colors.black,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 15,
      ),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(16),
        hintText: StringConstants.placeholder,
        hintStyle: TextStyle(color: Colors.grey[700]),
        filled: true,
        fillColor: Colors.grey.shade200,
        suffixIcon: SizedBox(
          width: 70,
          child: Row(children: [
            const Icon(
              Icons.search_rounded,
              color: Colors.grey,
            ),
            const SizedBox(
              height: 22,
              child: VerticalDivider(
                color: Colors.grey,
                width: 11,
                thickness: 1,
              ),
            ),
            Icon(
              Icons.mic_rounded,
              color: Colors.orange[800],
            )
          ]),
        ),
        border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(14)),
      ),
    );
  }
}
