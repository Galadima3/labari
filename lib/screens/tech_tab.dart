import 'package:flutter/material.dart';

class TechTab extends StatefulWidget {
  const TechTab({super.key});

  @override
  State<TechTab> createState() => _TechTabState();
}

class _TechTabState extends State<TechTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Center(child: Text('TECH'),),
    );
  }
}