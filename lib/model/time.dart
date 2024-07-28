import 'package:freezed_annotation/freezed_annotation.dart';

part 'time.freezed.dart';

@freezed
class Time with _$Time {
  const factory Time({
    required int msec,
    required bool isRunning,
  }) = _Time;
}
