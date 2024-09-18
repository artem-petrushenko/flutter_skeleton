import 'package:flutter/material.dart';

class LoggerCard extends StatelessWidget {
  const LoggerCard({
    super.key,
    required this.title,
    required this.date,
  });

  final String title;
  final DateTime date;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(title),
        subtitle: Text(date.toString()),
      ),
    );
  }
}
