import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timer_flutter/model/count_up_timer_provider.dart';
import 'package:timer_flutter/page/widget/template_widget.dart';

class CountUpPage extends ConsumerStatefulWidget {
  const CountUpPage({super.key});

  @override
  ConsumerState<CountUpPage> createState() => _CountUpPage();
}

class _CountUpPage extends ConsumerState<CountUpPage> {
  @override
  Widget build(BuildContext context) {
    final countUpTimerProvider =
        ref.read(countUpTimerNotifierProvider.notifier);
    final countUpTimerValue = ref.watch(countUpTimerNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Count Up Timer Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _getTimeTextWidget(countUpTimerValue.msec),
            const SizedBox(height: 20),
            countUpTimerValue.isRunning
                ? TemplateWidgets.button(
                    text: '一時停止',
                    onPressed: countUpTimerProvider.pauseTimer,
                  )
                : TemplateWidgets.button(
                    text: 'スタート',
                    onPressed: countUpTimerProvider.resumeTimer,
                  ),
            TemplateWidgets.button(
              text: 'リセット',
              onPressed: countUpTimerProvider.resetTimer,
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
