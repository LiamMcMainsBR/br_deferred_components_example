import 'package:flutter/material.dart';

/// Deferred settings page
class AdminSettingsPage extends StatelessWidget {
  const AdminSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Admin Settings"),
      ),
      body: ListView(children: [
        SwitchListTile(
          value: false,
          onChanged: (value) {},
          title: const Text("Admin Powers"),
        ),
        SwitchListTile(
          value: false,
          onChanged: (value) {},
          title: const Text("Volunteer for next C&T"),
        ),
        SwitchListTile(
          value: false,
          onChanged: (value) {},
          title: const Text("Enable 10x Development Mode"),
        ),
      ]),
    );
  }
}
