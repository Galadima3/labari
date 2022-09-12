import 'package:flutter/material.dart';

class CovidTab extends StatefulWidget {
  const CovidTab({super.key});

  @override
  State<CovidTab> createState() => _CovidTabState();
}

class _CovidTabState extends State<CovidTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Center(child: Text('COVID-19'),),
    );
  }
}