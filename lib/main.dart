import 'package:br_deferred_components_example/free_wallpapers.dart';
import 'package:br_deferred_components_example/premium_wallpapers_cta.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'premium_cat_wallpapers.dart' deferred as deferred_cat_wallpapers;

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  Future<void>? _libraryFuture;
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.red),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Deferred Wallpapers'),
          actions: [
            if (_libraryFuture != null)
              IconButton(
                  onPressed: () {
                    setState(() {
                      _libraryFuture = null;
                    });

                    DeferredComponent.uninstallDeferredComponent(
                      componentName: "catWallpapersComponent",
                    );
                  },
                  icon: const Icon(Icons.cancel))
          ],
        ),
        body: currentIndex == 0
            ? const FreeWallpapersList()
            : PremiumWallpapersList(
                componentDownloadFuture: _libraryFuture,
                child: deferred_cat_wallpapers.PremiumCatWallpapers(),
                onTapSubscribe: () {
                  setState(() {
                    // _libraryFuture = deferred_cat_wallpapers.loadLibrary();

                    // Introduce fake delay for local testing
                    _libraryFuture = Future.delayed(const Duration(seconds: 1))
                        .then((value) => deferred_cat_wallpapers.loadLibrary());
                  });
                },
              ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (value) => setState(() {
            currentIndex = value;
          }),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: "Free"),
            BottomNavigationBarItem(icon: Icon(Icons.pets), label: "Premium")
          ],
        ),
      ),
    );
  }
}
