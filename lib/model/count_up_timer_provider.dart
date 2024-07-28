import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:timer_flutter/model/time.dart';

part 'count_up_timer_provider.g.dart';

@riverpod
class CountUpTimerNotifier extends _$CountUpTimerNotifier {
  Timer? _timer;
  bool _isRunning = false;

  @override
  Time build() {
    ref.onDispose(
      () {
        _timer?.cancel();
      },
    );
    return const Time(msec: 0, isRunning: false);
  }

  void startTimer() {
    if (_isRunning) {
      return;
    }
    resetTimer();
    _setIsRunning(true);

    _timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      if (!_isRunning) {
        return;
      }
      state = state.copyWith(msec: state.msec + 100);
    });
  }

  void resetTimer() {
    _setIsRunning(false);
    _timer?.cancel();
    state = state.copyWith(msec: 0);
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
