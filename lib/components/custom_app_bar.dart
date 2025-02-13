import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 2,
      centerTitle: true,
      title: Text(
        'Breakfast',
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            // Action du menu
          },
          icon: SvgPicture.asset(
            'icons/dots.svg',
            width: 10,
            height: 10,
            colorFilter: ColorFilter.mode(Colors.black, BlendMode.srcIn),
          ),
          splashRadius: 20,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
