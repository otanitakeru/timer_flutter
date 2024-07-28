import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:timer_flutter/page/widget/template_widget.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePage();
}

class _HomePage extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TemplateWidgets.button(
              text: 'Count Up Timer',
              onPressed: () {
                GoRouter.of(context).push('/count_up');
              },
            ),
            TemplateWidgets.button(
              text: 'Count Down Timer',
              onPressed: () {
                GoRouter.of(context).push('/count_down');
              },
            ),
          ],
        ),
      ),
    );
  }
}
