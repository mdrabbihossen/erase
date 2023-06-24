import 'package:flutter/material.dart';

class BottomNav extends StatelessWidget {
  final VoidCallback? onPress;

  const BottomNav({
    Key? key,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: ElevatedButton(
        onPressed: onPress,
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.arrow_forward_ios_rounded),
            SizedBox(
              width: 10,
            ),
            Text("Remove Background"),
          ],
        ),
      ),
    );
  }
}
