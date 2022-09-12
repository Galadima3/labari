import 'package:flutter/material.dart';

class CryptoTab extends StatefulWidget {
  const CryptoTab({super.key});

  @override
  State<CryptoTab> createState() => _CryptoTabState();
}

class _CryptoTabState extends State<CryptoTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Center(child: Text('CRYPTO'),),
    );
  }
}