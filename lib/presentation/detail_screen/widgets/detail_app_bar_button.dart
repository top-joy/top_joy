import 'package:flutter/material.dart';

class DetailAppBarButton extends StatelessWidget {
  final IconData icon;
  final Function() onPressed;
  const DetailAppBarButton({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.black.withOpacity(.4),
      child: IconButton(
        icon: Icon(
          icon,
          color: Colors.white,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
