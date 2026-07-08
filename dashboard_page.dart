import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/state/app_state_notifier.dart';
import '../../../shared/widgets/app_shell.dart';

class DashboardPage extends ConsumerWidget { const DashboardPage({super.key});
  @override Widget build(BuildContext context, WidgetRef ref) { final s = ref.watch(appStateProvider); return AppShell(title: 'TimeReport Pro', child: ListView(padding: const EdgeInsets.all(16), children: [
    Text('Dashboard', style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold)), const SizedBox(height: 16),
    GridView.count(crossAxisCount: 2, shrinkWrap: true, physics: const NeverScrollableScrollPhysics(), crossAxisSpacing: 12, mainAxisSpacing: 12, children: [
      _card(context, 'Hours', '${s.totalHours.toStringAsFixed(2)} h', Icons.timer), _card(context, 'Reports', '${s.reports.length}', Icons.receipt_long), _card(context, 'Km', '${s.totalKm.toStringAsFixed(0)} km', Icons.directions_car), _card(context, 'Costs', '${s.totalCosts.toStringAsFixed(0)} SEK', Icons.payments),
    ]),
  ])); }
  Widget _card(BuildContext c, String title, String value, IconData icon) => Card(child: Padding(padding: const EdgeInsets.all(16), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Icon(icon), const Spacer(), Text(title), Text(value, style: Theme.of(c).textTheme.headlineSmall)])));
}
