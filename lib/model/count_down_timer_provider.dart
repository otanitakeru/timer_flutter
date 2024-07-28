import 'dart:async';
import 'dart:ffi';
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
  Time build() {
    ref.onDispose(
      () {
        _timer?.cancel();
      },
    );
    return const Time(msec: 0, isRunning: false);
  }

  void startTimer({required VoidCallback onTimerEnd, required int duration}) {
    if (_isRunning) {
      return;
    }

    _duration = duration;
    resetTimer();
    _setIsRunning(true);

    _timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      if (!_isRunning) {
        return;
      }
      state = state.copyWith(msec: state.msec - 100);
      if (state.msec <= 0) {
        _setIsRunning(false);
        onTimerEnd();
      }
    });
  }

  void resetTimer() {
    _setIsRunning(false);
    _timer?.cancel();
    state = state.copyWith(msec: _duration);
  }

  void pauseTimer() {
    if (!_isRunning) {
      return;
    }
    _setIsRunning(false);
  }

  void resumeTimer() {
    if (_isRunning) {
      return;
    }
    _setIsRunning(true);
  }

  void _setIsRunning(bool isRunning) {
    _isRunning = isRunning;
    state = state.copyWith(isRunning: isRunning);
  }
}
