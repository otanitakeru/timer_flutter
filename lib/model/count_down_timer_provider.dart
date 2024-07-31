import 'dart:async';
import 'dart:ui';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:timer_flutter/model/time.dart';

part 'count_down_timer_provider.g.dart';

@riverpod
class CountDownTimerNotifier extends _$CountDownTimerNotifier {
  Timer? _timer;
  bool _isRunning = false;
  int _duration = 0;

  @override
  Time build({required VoidCallback onTimerEnd}) {
    _onDispose();
    _generateTimer(onTimerEnd: onTimerEnd);

    return const Time(msec: 0, isRunning: false);
  }

  void setTime({required int duration}) {
    if (_isRunning) {
      return;
    }
    _duration = duration;
    state = state.copyWith(msec: duration);
  }

  void resetTimer() {
    _setIsRunning(false);
    state = state.copyWith(msec: _duration);
  }

  void pauseTimer() {
    if (!_isRunning || state.msec <= 0) {
      return;
    }
    _setIsRunning(false);
  }

  void resumeTimer() {
    if (_isRunning || state.msec <= 0) {
      return;
    }
    _setIsRunning(true);
  }

  void _generateTimer({required VoidCallback onTimerEnd}) {
    _timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      if (!_isRunning) {
        return;
      }
      if (state.msec <= 0) {
        resetTimer();
        onTimerEnd();
        return;
      }
      state = state.copyWith(msec: state.msec - 100);
    });
  }

  void _setIsRunning(bool isRunning) {
    _isRunning = isRunning;
    state = state.copyWith(isRunning: isRunning);
  }

  void _onDispose() {
    ref.onDispose(
      () {
        _timer?.cancel();
      },
    );
  }
}
