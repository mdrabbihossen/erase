import 'package:erase/views/home/widgets/bottom_navbar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool loaded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        leading: const Icon(Icons.sort_rounded),
        title: const Text("Erase: Remove Background"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {},
          child: const Text("Remove Background"),
        ),
      ),
      bottomNavigationBar: BottomNav(
        onPress: loaded ? () {} : null,
      ),
    );
  }
}
