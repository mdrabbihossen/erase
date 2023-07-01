import 'package:flutter/material.dart';

class BottomNav extends StatelessWidget {
  final VoidCallback? onPress;
  final Widget child;

  const BottomNav({
    Key? key,
    required this.onPress,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: ElevatedButton(
        onPressed: onPress,
        child: child,
      ),
    );
  }
}
