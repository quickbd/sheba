import 'package:flutter/material.dart';
import 'package:sheba/Widgets/Services.dart';

import '../Widgets/adCarousel.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    // double _height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: _width,
            height: 300.0,
            child: ServiceMod(),
          ),
        ),
        Expanded(
          child: Ads(),
        ),
      ],
    );
  }
}
