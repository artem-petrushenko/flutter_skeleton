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
      appBar: AppBar(title: const Text('Logger')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: StreamBuilder<List<LogMessage>>(
          stream: Stream.value(DefaultLogger().logHistory),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }
            final logMessages = snapshot.data!;
            return CustomScrollView(
              slivers: [
                SliverList.separated(
                  separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 8.0),
                  itemCount: logMessages.length,
                  itemBuilder: (BuildContext context, int index) {
                    final logMessage = logMessages[index];
                    return LoggerCard(
                      message: logMessage.message,
                      timestamp: logMessage.timestamp,
                      level: logMessage.level,
                      error: logMessage.error,
                      stackTrace: logMessage.stackTrace,
                      context: logMessage.context,
                    );
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
