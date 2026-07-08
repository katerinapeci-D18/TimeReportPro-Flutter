import 'package:flutter/material.dart';
import '../../../shared/widgets/app_shell.dart';
class SettingsPage extends StatelessWidget { const SettingsPage({super.key}); @override Widget build(BuildContext context) => const AppShell(title: 'Settings', child: Padding(padding: EdgeInsets.all(16), child: Card(child: ListTile(title: Text('TimeReport Pro v0.2'), subtitle: Text('State and CRUD foundation. SQLite comes next.'))))); }
