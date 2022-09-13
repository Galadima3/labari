// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class CovidTab extends StatefulWidget {
  const CovidTab({super.key});

  @override
  State<CovidTab> createState() => _CovidTabState();
}

class _CovidTabState extends State<CovidTab> {
  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Text('COVID-19'),
      );
  }
}

