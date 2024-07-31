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
        countDownTimerNotifierProvider(onTimerEnd: _showSnackBar);
    final countDoenTimerNotifier = ref.read(countDownTimerProvider.notifier);
    final countDownTimerValue = ref.watch(countDownTimerProvider);

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
                text: '5秒セット',
                onPressed: () {
                  countDoenTimerNotifier.setTime(
                    duration: 5000,
                  );
                }),
            countDownTimerValue.isRunning
                ? TemplateWidgets.button(
                    text: '一時停止',
                    onPressed: countDoenTimerNotifier.pauseTimer,
                  )
                : TemplateWidgets.button(
                    text: 'スタート',
                    onPressed: countDoenTimerNotifier.resumeTimer,
                  ),
            TemplateWidgets.button(
              text: 'リセット',
              onPressed: countDoenTimerNotifier.resetTimer,
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

  void _showSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Timer End'),
      ),
    );
  }
}
