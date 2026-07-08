import 'package:flutter/material.dart';
import '../../../core/localization/app_localizations.dart';
import '../../../shared/widgets/app_shell.dart';

class CompaniesPage extends StatelessWidget {
  const CompaniesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return AppShell(
      title: l10n.t('companies'),
      child: ListView(padding: const EdgeInsets.all(16), children: [
        Text(l10n.t('companies'), style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.w800)),
        const SizedBox(height: 16),
        Card(child: ListTile(
          leading: const Icon(Icons.construction),
          title: Text(l10n.t('coming_soon')),
          subtitle: Text(l10n.t('foundation_ready')),
        )),
      ]),
    );
  }
}
