import 'package:flutter/material.dart';

const images = [
  "lib/assets/abstract.jpg",
  "lib/assets/beach.jpg",
  "lib/assets/mountains.jpg",
  "lib/assets/road.jpg",
  "lib/assets/trees.jpg",
];

class FreeWallpapersList extends StatelessWidget {
  const FreeWallpapersList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(images[0]),
            const SizedBox(
              height: 16,
            ),
            Image.asset(images[1]),
            const SizedBox(
              height: 16,
            ),
            Image.asset(images[2]),
            const SizedBox(
              height: 16,
            ),
            Image.asset(images[3]),
            const SizedBox(
              height: 16,
            ),
            Image.asset(images[4]),
          ],
        ),
      ),
    );
  }
}
