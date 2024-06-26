import 'package:flutter/material.dart';

class InternetWidget extends StatelessWidget {
  const InternetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          Icons.wifi_find,
          size: 100,
        ),
        SizedBox(
          height: 10,
        ),
        Text("Check your internet Connection")
      ],
    );
  }
}
