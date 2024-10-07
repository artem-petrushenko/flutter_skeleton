import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_skeleton/src/core/utils/logger/refined_logger.dart';

class LoggerCard extends StatefulWidget {
  const LoggerCard({
    super.key,
    required this.message,
    required this.level,
    required this.timestamp,
    this.error,
    this.stackTrace,
    this.context,
  });

  final String message;
  final DateTime timestamp;
  final LogLevel level;
  final Object? error;
  final StackTrace? stackTrace;
  final Map<String, Object?>? context;

  @override
  State<LoggerCard> createState() => _LoggerCardState();
}

class _LoggerCardState extends State<LoggerCard> {
  final ValueNotifier<bool> _isExpanded = ValueNotifier(false);

  @override
  void dispose() {
    _isExpanded.dispose();
    super.dispose();
  }

  void _copyToClipboard() {
    final buffer = StringBuffer();
    buffer.writeln('${widget.timestamp.toIso8601String()} - ${widget.level.name}');
    buffer.writeln(widget.message);

    if (widget.error != null) {
      buffer.writeln('Error: ${widget.error}');
    }
    if (widget.stackTrace != null) {
      buffer.writeln('Stack Trace: ${widget.stackTrace}');
    }

    Clipboard.setData(ClipboardData(text: buffer.toString()));

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Скопировано в буфер обмена')),
    );
  }

  @override
  Widget build(BuildContext context) {
    //TODO: Rewrite to NoSplashInkWell
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border.all(color: _color),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: InkWell(
        onTap: () => _isExpanded.value = !_isExpanded.value,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.level.name.toUpperCase(),
                          style: TextStyle(color: _color),
                        ),
                        Text(widget.timestamp.toIso8601String()),
                        Text(widget.message),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.copy,
                      color: _color,
                    ),
                    onPressed: _copyToClipboard,
                    tooltip: 'Скопировать',
                  ),
                ],
              ),
              ValueListenableBuilder(
                valueListenable: _isExpanded,
                builder: (context, isExpanded, child) {
                  if (!isExpanded) {
                    return const SizedBox.shrink();
                  }
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (widget.error != null) ...[
                        Text('Error: ${widget.error}'),
                      ],
                      if (widget.stackTrace != null) ...[
                        Text('Stack Trace: ${widget.stackTrace}'),
                      ],
                      if (widget.context != null) ...[
                        Text(widget.context.toString()),
                      ],
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color get _color {
    switch (widget.level) {
      case LogLevel.debug:
        return Colors.orangeAccent;
      case LogLevel.info:
        return Colors.blueAccent;
      case LogLevel.error:
        return Colors.red;
      case LogLevel.trace:
        return Colors.purple;
      case LogLevel.warn:
        return Colors.orange;
      case LogLevel.fatal:
        return Colors.red;
      case LogLevel.transition:
        return Colors.cyanAccent;
      case LogLevel.blocEvent:
        return Colors.greenAccent;
      case LogLevel.blocTransition:
        return Colors.indigoAccent;
    }
  }
}
