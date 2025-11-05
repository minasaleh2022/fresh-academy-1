import 'package:flutter/material.dart';

class CourseDetailsScreen extends StatelessWidget {
  final String courseId;
  const CourseDetailsScreen({super.key, required this.courseId});
  @override
  Widget build(BuildContext context) => DefaultTabController(
    length: 3,
    child: Scaffold(
      appBar: AppBar(title: Text('Course $courseId'), bottom: const TabBar(tabs: [
        Tab(text: 'Lessons'), Tab(text: 'Materials'), Tab(text: 'Schedule')
      ])),
      body: const TabBarView(
        children: [
          Center(child: Text('Lessons & progress bar ...')),
          Center(child: Text('PDFs / Images / Videos ...')),
          Center(child: Text('Upcoming sessions ...')),
        ],
      ),
    ),
  );
}
