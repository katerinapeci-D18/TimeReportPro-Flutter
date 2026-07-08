import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/state/app_state_notifier.dart';
import '../../../shared/widgets/app_shell.dart';

class TimeReportPage extends ConsumerStatefulWidget { const TimeReportPage({super.key}); @override ConsumerState<TimeReportPage> createState() => _TimeReportPageState(); }
class _TimeReportPageState extends ConsumerState<TimeReportPage> { final hours = TextEditingController(); final km = TextEditingController(); final parking = TextEditingController(); final comment = TextEditingController();
  @override Widget build(BuildContext context) { final s = ref.watch(appStateProvider); return AppShell(title: 'Time Report', child: ListView(padding: const EdgeInsets.all(16), children: [
    TextField(controller: hours, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: 'Hours')), const SizedBox(height: 12),
    TextField(controller: km, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: 'Kilometers')), const SizedBox(height: 12),
    TextField(controller: parking, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: 'Parking')), const SizedBox(height: 12),
    TextField(controller: comment, decoration: const InputDecoration(labelText: 'Comment')), const SizedBox(height: 16),
    FilledButton(onPressed: () { ref.read(appStateProvider.notifier).addReport(hours: double.tryParse(hours.text) ?? 0, kilometers: double.tryParse(km.text) ?? 0, parking: double.tryParse(parking.text) ?? 0, comment: comment.text); hours.clear(); km.clear(); parking.clear(); comment.clear(); }, child: const Text('Save')),
    const SizedBox(height: 20), ...s.reports.reversed.map((r) => Card(child: ListTile(title: Text('${r.hours} h'), subtitle: Text(r.comment ?? ''), trailing: Text('${r.costs} SEK')))),
  ])); }
}
