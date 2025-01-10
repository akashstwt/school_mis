import 'package:flutter/material.dart';

class DrawerListTile extends StatelessWidget {
  final String name;
  final String imgpath;
  final GestureTapCallback ontap;

  const DrawerListTile({
    super.key, // Use optional key here
    required this.name,
    required this.imgpath,
    required this.ontap,
  });
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: ontap,
      leading: Image.asset(
        "assets/$imgpath",
        height: 30,
      ),
      contentPadding: const EdgeInsets.only(
        left: 70,
        top: 5,
        bottom: 5,
      ),
      title: Text(
        name,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
