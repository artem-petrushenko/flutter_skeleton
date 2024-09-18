import 'package:flutter/material.dart';
import 'package:flutter_skeleton/src/core/utils/logger/refined_logger.dart';
import 'package:flutter_skeleton/src/feature/logger/widget/logger_card.dart';

class LoggerScreen extends StatelessWidget {
  const LoggerScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Log History')),
      body: StreamBuilder<List<LogMessage>>(
        stream: Stream.value(DefaultLogger().logHistory),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          final logMessages = snapshot.data!;
          return ListView.builder(
            itemCount: logMessages.length,
            itemBuilder: (context, index) {
              final logMessage = logMessages[index];
              return LoggerCard(
                title: logMessage.message,
                date: logMessage.timestamp,
              );
            },
          );
        },
      ),
    );
  }
}
