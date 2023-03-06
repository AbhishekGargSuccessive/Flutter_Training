import 'package:flutter/material.dart';
import '../../core/constant/image_constants.dart';
import '../../core/constant/string_constants.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: kToolbarHeight,
      backgroundColor: Colors.transparent,
      shadowColor: Colors.transparent,
      title: Column(children: [
        Row(children: [
          Image.asset(
            ImageConstants.addressLocation,
            width: 24,
            color: Colors.orange[800],
          ),
          const Text(
            StringConstants.noida,
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          Icon(
            Icons.keyboard_arrow_down_rounded,
            color: Colors.grey[700],
            size: 25,
          ),
        ]),
        Row(
          children: const [
            Flexible(
              child: Text(
                StringConstants.address,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ]),
      actions: [
        Builder(builder: (context) {
          return IconButton(
              padding: const EdgeInsets.only(right: 10),
              onPressed: () {
                Scaffold.of(context).openEndDrawer();
              },
              icon: const Icon(
                Icons.account_circle_rounded,
                color: Colors.black,
                size: 34,
              ));
        })
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
