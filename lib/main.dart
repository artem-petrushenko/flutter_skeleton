import 'dart:async';

import 'package:flutter_skeleton/src/core/utils/refined_logger.dart';
import 'package:flutter_skeleton/src/feature/app/logic/app_runner.dart';

void main() => runZonedGuarded(
      () => const AppRunner().initializeAndRun(),
      logger.logZoneError,
    );
