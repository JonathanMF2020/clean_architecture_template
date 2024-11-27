import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    if (kDebugMode) {
      print(
          "[Bloc] Se ha creado un ${bloc.toString()} y se inicializo con ${bloc.state}");
    }
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    if (kDebugMode) {
      print("[Bloc] Esta ocurriendo un evento en $bloc evento: ${bloc.state}");
    }
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    if (kDebugMode) {
      print(
          "[Bloc] Esta cambiando el estado en $bloc de ${transition.currentState} a ${transition.nextState}");
    }
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    if (kDebugMode) {
      debugPrintStack(stackTrace: stackTrace);
      print("[Bloc] Ha ocurrido un error en $bloc error ${error.toString()}");
    }
  }
}
