import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CoursesCatalogScreen extends StatelessWidget {
  const CoursesCatalogScreen({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Courses Catalog')),
    body: GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: .9, crossAxisSpacing: 12, mainAxisSpacing: 12),
      itemCount: 6,
      itemBuilder: (_, i) => Card(
        child: InkWell(
          onTap: () => context.push('/course/$i'),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Expanded(child: Container(color: Colors.grey.shade200)),
              const SizedBox(height: 8),
              Text('Course #$i', style: const TextStyle(fontWeight: FontWeight.bold)),
              const Text('12 lessons • 1 week'),
            ]),
          ),
        ),
      ),
    ),
  );
}
