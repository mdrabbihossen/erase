import 'package:flutter/material.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: ElevatedButton(
        onPressed: () {},
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
