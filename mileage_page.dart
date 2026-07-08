import 'package:flutter/material.dart';
import '../../../core/localization/app_localizations.dart';
import '../../../shared/widgets/app_shell.dart';

class MileagePage extends StatelessWidget {
  const MileagePage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return AppShell(
      title: l10n.t('mileage_log'),
      child: ListView(padding: const EdgeInsets.all(16), children: [
        Text(l10n.t('mileage_log'), style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.w800)),
        const SizedBox(height: 16),
        TextField(decoration: InputDecoration(labelText: l10n.t('from'))),
        const SizedBox(height: 12),
        TextField(decoration: InputDecoration(labelText: l10n.t('to'))),
        const SizedBox(height: 12),
        TextField(decoration: InputDecoration(labelText: l10n.t('kilometers')), keyboardType: TextInputType.number),
        const SizedBox(height: 20),
        FilledButton.icon(onPressed: () {}, icon: const Icon(Icons.save), label: Text(l10n.t('save'))),
      ]),
    );
  }
}
