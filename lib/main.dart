import 'package:br_deferred_components_example/admin_settings_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int index = 0;
  bool isAdmin = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.red),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Deferred Components'),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.person)),
            if (isAdmin)
              Builder(builder: (context) {
                return IconButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const AdminSettingsPage()));
                    },
                    icon: const Icon(Icons.admin_panel_settings));
              }),
          ],
        ),
        body: Center(
          child: Column(children: [
            FilledButton.tonal(
              child: const Text('Become admin'),
              onPressed: () {
                setState(() {
                  isAdmin = true;
                });
              },
            ),
            FilledButton.tonal(
              child: const Text('Remove admin'),
              onPressed: () {
                setState(() {
                  isAdmin = false;
                });
              },
            )
          ]),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: index,
          onTap: (value) => setState(() {
            index = value;
          }),
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.dashboard), label: "Dashboard"),
            BottomNavigationBarItem(icon: Icon(Icons.warning), label: "Issues")
          ],
        ),
      ),
    );
  }
}
