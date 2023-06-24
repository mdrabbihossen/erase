import 'package:erase/views/home/widgets/bottom_navbar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        leading: const Icon(Icons.sort_rounded),
        title: const Text("Erase: Remove Background"),
      ),
      bottomNavigationBar: const BottomNav(),
    );
  }
}
