import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timer_flutter/model/count_down_timer_provider.dart';
import 'package:timer_flutter/page/widget/template_widget.dart';

class CountDownPage extends ConsumerStatefulWidget {
  const CountDownPage({super.key});

  @override
  ConsumerState<CountDownPage> createState() => _CountDownPage();
}

class _CountDownPage extends ConsumerState<CountDownPage> {
  @override
  Widget build(BuildContext context) {
    final countDownTimerProvider =
        ref.read(countDownTimerNotifierProvider.notifier);
    final countDownTimerValue = ref.watch(countDownTimerNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Count Up Timer Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _getTimeTextWidget(countDownTimerValue.msec),
            const SizedBox(height: 20),
            TemplateWidgets.button(
                text: 'スタート',
                onPressed: () {
                  countDownTimerProvider.startTimer(
                    onTimerEnd: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Timer End'),
                        ),
                      );
                    },
                    duration: 10000,
                  );
                }),
            TemplateWidgets.button(
              text: 'リセット',
              onPressed: countDownTimerProvider.resetTimer,
            ),
            countDownTimerValue.isRunning
                ? TemplateWidgets.button(
                    text: '一時停止',
                    onPressed: countDownTimerProvider.pauseTimer,
                  )
                : TemplateWidgets.button(
                    text: '再開',
                    onPressed: countDownTimerProvider.resumeTimer,
                  ),
          ],
        ),
      ),
    );
  }

  Widget _getTimeTextWidget(int msec) {
    return Container(
      alignment: Alignment.centerLeft,
      width: 200,
      child: Text(
        'Time: ${msec ~/ 1000}.${(msec % 1000) ~/ 100}',
        style: const TextStyle(fontSize: 30),
      ),
    );
  }
}
