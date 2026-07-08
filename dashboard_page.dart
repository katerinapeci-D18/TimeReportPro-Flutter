import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/localization/app_localizations.dart';
import '../../../shared/widgets/app_shell.dart';
import '../../../shared/widgets/stat_card.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return AppShell(
      title: 'TimeReport Pro',
      child: ListView(padding: const EdgeInsets.all(16), children: [
        Text(l10n.t('dashboard'), style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.w800)),
        const SizedBox(height: 16),
        GridView.count(
          crossAxisCount: MediaQuery.sizeOf(context).width > 600 ? 3 : 2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: const [
            StatCard(title: 'Today', value: '0 h', icon: Icons.today),
            StatCard(title: 'Week', value: '0 h', icon: Icons.calendar_view_week),
            StatCard(title: 'Month', value: '0 h', icon: Icons.calendar_month),
            StatCard(title: 'Costs', value: '0 SEK', icon: Icons.payments),
          ],
        ),
        const SizedBox(height: 20),
        FilledButton.icon(onPressed: () => context.go('/time-report'), icon: const Icon(Icons.add), label: Text(l10n.t('new_report'))),
        const SizedBox(height: 12),
        OutlinedButton.icon(onPressed: () => context.go('/mileage'), icon: const Icon(Icons.directions_car), label: Text(l10n.t('mileage_log'))),
      ]),
    );
  }
}
