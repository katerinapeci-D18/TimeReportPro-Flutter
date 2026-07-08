import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/state/app_state_notifier.dart';
import '../../../shared/widgets/app_shell.dart';

class MileagePage extends ConsumerStatefulWidget { const MileagePage({super.key}); @override ConsumerState<MileagePage> createState() => _MileagePageState(); }
class _MileagePageState extends ConsumerState<MileagePage> { final from = TextEditingController(); final to = TextEditingController(); final km = TextEditingController(); final rate = TextEditingController();
  @override Widget build(BuildContext context) { final s = ref.watch(appStateProvider); return AppShell(title: 'Mileage Log', child: ListView(padding: const EdgeInsets.all(16), children: [
    TextField(controller: from, decoration: const InputDecoration(labelText: 'From')), const SizedBox(height: 12), TextField(controller: to, decoration: const InputDecoration(labelText: 'To')), const SizedBox(height: 12), TextField(controller: km, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: 'Kilometers')), const SizedBox(height: 12), TextField(controller: rate, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: 'Rate per km')), const SizedBox(height: 16),
    FilledButton(onPressed: () { ref.read(appStateProvider.notifier).addMileage(from: from.text, to: to.text, kilometers: double.tryParse(km.text) ?? 0, rate: double.tryParse(rate.text) ?? 0); from.clear(); to.clear(); km.clear(); rate.clear(); }, child: const Text('Save')),
    const SizedBox(height: 20), ...s.mileage.reversed.map((m) => Card(child: ListTile(title: Text('${m.from} → ${m.to}'), subtitle: Text('${m.kilometers} km'), trailing: Text('${m.amount} SEK')))),
  ])); }
}
