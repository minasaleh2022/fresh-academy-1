import 'package:flutter/material.dart';

class ReportsDashboard extends StatelessWidget {
  const ReportsDashboard({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Reports & Analytics')),
    body: ListView(
      padding: const EdgeInsets.all(16),
      children: const [
        Card(child: ListTile(title: Text('Technicians Trained'), trailing: Text('1,280'))),
        Card(child: ListTile(title: Text('Avg Monthly Hours'), trailing: Text('110'))),
        Card(child: ListTile(title: Text('Overall Success Rate'), trailing: Text('92%'))),
        SizedBox(height: 12),
        Text('Charts coming next (fl_chart + pdf export)'),
      ],
    ),
  );
}
