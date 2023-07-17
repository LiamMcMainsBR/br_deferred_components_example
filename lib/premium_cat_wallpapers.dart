import 'package:flutter/material.dart';

class PremiumCatWallpapers extends StatelessWidget {
  const PremiumCatWallpapers({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset("lib/assets/paid/cat1.jpg"),
        const SizedBox(
          height: 16,
        ),
        Image.asset("lib/assets/paid/cat2.jpg"),
        const SizedBox(
          height: 16,
        ),
        Image.asset("lib/assets/paid/cat3.jpg"),
      ],
    );
  }
}
