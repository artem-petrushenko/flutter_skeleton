import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_skeleton/src/core/utils/logger/refined_logger.dart';

/// [BlocObserver] which logs all bloc state changes, errors and events.
class AppBlocObserver extends BlocObserver {
  /// Creates an instance of [AppBlocObserver] with the provided [logger].
  const AppBlocObserver();

  /// Logger used to log information during bloc transitions.

  @override
  void onTransition(
    Bloc<Object?, Object?> bloc,
    Transition<Object?, Object?> transition,
  ) {
    logger.blocTransition(
      'Bloc ${bloc.runtimeType} with event ${transition.event.runtimeType}',
      context: {
        'CURRENT State': transition.currentState.runtimeType,
        'NEXT State': transition.currentState.runtimeType,
      },
    );
    super.onTransition(bloc, transition);
  }

  @override
  void onEvent(Bloc<Object?, Object?> bloc, Object? event) {
    logger.blocEvent('Event: $event', context: {
      'Bloc': bloc,
      'Details': event,
      'State': bloc.state,
      'Type': event,
    });
    super.onEvent(bloc, event);
  }

  @override
  void onError(BlocBase<Object?> bloc, Object error, StackTrace stackTrace) {
    logger.error(
      'Bloc: ${bloc.runtimeType}',
      error: error,
      stackTrace: stackTrace,
    );
    super.onError(bloc, error, stackTrace);
  }
}
