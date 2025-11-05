import 'package:flutter/material.dart';

class SupportHomeScreen extends StatelessWidget {
  const SupportHomeScreen({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Technical Support')),
    body: ListView(
      padding: const EdgeInsets.all(16),
      children: const [
        ListTile(leading: Icon(Icons.help_outline), title: Text('Get Assistance')),
        ListTile(leading: Icon(Icons.menu_book_outlined), title: Text('Knowledge Base')),
        ListTile(leading: Icon(Icons.smart_toy_outlined), title: Text('Smart Assistant')),
        ListTile(leading: Icon(Icons.confirmation_number_outlined), title: Text('My Tickets')),
      ],
    ),
  );
}
