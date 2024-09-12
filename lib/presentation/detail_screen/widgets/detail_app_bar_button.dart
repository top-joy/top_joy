import 'package:flutter/material.dart';

class DetailAppBarButton extends StatelessWidget {
  final IconData icon;
  final Function() onPressed;
  final Color color;
  const DetailAppBarButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.color = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.black.withOpacity(.4),
      child: IconButton(
        icon: Icon(
          icon,
          color: color,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
