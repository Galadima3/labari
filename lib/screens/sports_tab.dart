import 'package:flutter/material.dart';

class SportsTab extends StatefulWidget {
  const SportsTab({super.key});

  @override
  State<SportsTab> createState() => _SportsTabState();
}

class _SportsTabState extends State<SportsTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Center(child: Text('SPORTS'),),
    );
  }
}