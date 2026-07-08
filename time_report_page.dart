import 'package:flutter/material.dart';
import '../../../core/localization/app_localizations.dart';
import '../../../shared/widgets/app_shell.dart';

class TimeReportPage extends StatefulWidget {
  const TimeReportPage({super.key});
  @override
  State<TimeReportPage> createState() => _TimeReportPageState();
}

class _TimeReportPageState extends State<TimeReportPage> {
  final _formKey = GlobalKey<FormState>();
  final _hoursController = TextEditingController();
  final _commentController = TextEditingController();
  DateTime _date = DateTime.now();

  @override
  void dispose() {
    _hoursController.dispose();
    _commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return AppShell(
      title: l10n.t('time_report'),
      child: Form(
        key: _formKey,
        child: ListView(padding: const EdgeInsets.all(16), children: [
          Text(l10n.t('new_report'), style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.w800)),
          const SizedBox(height: 16),
          ListTile(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            tileColor: Theme.of(context).colorScheme.surfaceContainerHighest,
            leading: const Icon(Icons.calendar_today),
            title: Text('${_date.year}-${_date.month.toString().padLeft(2, '0')}-${_date.day.toString().padLeft(2, '0')}'),
            trailing: const Icon(Icons.edit_calendar),
            onTap: () async {
              final selected = await showDatePicker(context: context, firstDate: DateTime(2020), lastDate: DateTime(2100), initialDate: _date);
              if (selected != null) setState(() => _date = selected);
            },
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller: _hoursController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: l10n.t('hours')),
            validator: (value) {
              final hours = double.tryParse(value ?? '');
              if (hours == null || hours <= 0) return l10n.t('invalid_hours');
              return null;
            },
          ),
          const SizedBox(height: 12),
          TextFormField(controller: _commentController, maxLines: 4, decoration: InputDecoration(labelText: l10n.t('comment'))),
          const SizedBox(height: 20),
          FilledButton.icon(onPressed: _save, icon: const Icon(Icons.save), label: Text(l10n.t('save'))),
        ]),
      ),
    );
  }

  void _save() {
    if (!_formKey.currentState!.validate()) return;
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Report saved locally soon. Database comes in v0.2.')));
  }
}
