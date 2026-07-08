import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppShell extends StatelessWidget {
  const AppShell({super.key, required this.title, required this.child});
  final String title; final Widget child;
  @override Widget build(BuildContext context) {
    final loc = GoRouterState.of(context).uri.toString();
    return Scaffold(appBar: AppBar(title: Text(title)), body: SafeArea(child: child), bottomNavigationBar: NavigationBar(selectedIndex: _index(loc), onDestinationSelected: (i) => _go(context, i), destinations: const [
      NavigationDestination(icon: Icon(Icons.dashboard_outlined), label: 'Home'),
      NavigationDestination(icon: Icon(Icons.timer_outlined), label: 'Time'),
      NavigationDestination(icon: Icon(Icons.directions_car_outlined), label: 'Mileage'),
      NavigationDestination(icon: Icon(Icons.business_outlined), label: 'Company'),
      NavigationDestination(icon: Icon(Icons.settings_outlined), label: 'Settings'),
    ]));
  }
  int _index(String l) => l.startsWith('/time-report') ? 1 : l.startsWith('/mileage') ? 2 : l.startsWith('/companies') ? 3 : l.startsWith('/settings') ? 4 : 0;
  void _go(BuildContext c, int i) { switch (i) { case 0: c.go('/'); case 1: c.go('/time-report'); case 2: c.go('/mileage'); case 3: c.go('/companies'); case 4: c.go('/settings'); } }
}
