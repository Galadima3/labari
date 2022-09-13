// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import '../widget.dart';

const apiKey = '726bef2cc5114d618ba36683689aa4e8';

class CryptoTab extends StatefulWidget {
  final newsData;
  const CryptoTab({super.key, this.newsData});

  @override
  State<CryptoTab> createState() => _CryptoTabState();
}

class _CryptoTabState extends State<CryptoTab> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Expanded(
          child: ListView(
            children: [
              //first headline
              NewsTile(
                  imagePath: 'images/bitcoin.jpg',
                  headlineText:
                      'Price of Bitcoin soars to \$90,000 following PoW upgrades',
                  publishDay: 'Today'),

              //second headline
              NewsTile(
                imagePath: 'images/bitcoin.jpg',
                headlineText:
                    'Demand for Bitcoin soars to an all-time high as retail investors flood the market',
                publishDay: 'Yesterday',
              ),
              NewsTile(
                imagePath: 'images/bitcoin.jpg',
                headlineText:
                    'Demand for Bitcoin soars to an all-time high as retail investors flood the market',
                publishDay: 'Yesterday',
              ),
              NewsTile(
                imagePath: 'images/bitcoin.jpg',
                headlineText:
                    'Demand for Bitcoin soars to an all-time high as retail investors flood the market',
                publishDay: 'Yesterday',
              ),
              NewsTile(
                imagePath: 'images/bitcoin.jpg',
                headlineText:
                    'Demand for Bitcoin soars to an all-time high as retail investors flood the market',
                publishDay: 'Yesterday',
              ),
            ],
          ),
        )
      ],
    );
  }
}
