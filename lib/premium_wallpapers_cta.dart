import 'package:flutter/material.dart';

class PremiumWallpapersList extends StatelessWidget {
  const PremiumWallpapersList({
    super.key,
    this.componentDownloadFuture,
    required this.child,
    required this.onTapSubscribe,
  });

  final Future<void>? componentDownloadFuture;
  final VoidCallback onTapSubscribe;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            if (componentDownloadFuture == null) ...[
              Center(
                  child: Text(
                "Cat pictures only available for premium subscribers!",
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.center,
              )),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FilledButton(
                    onPressed: onTapSubscribe,
                    child: const Text("Subscribe for \$5.99")),
              )
            ] else
              FutureBuilder(
                future: componentDownloadFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.active ||
                      snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return child;
                  }
                },
              ),
          ],
        ),
      ),
    );
  }
}
