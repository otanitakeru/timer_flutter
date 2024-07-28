import 'package:flutter/material.dart';

class TemplateWidgets {
  static button({required String text, required Function onPressed}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () {
          onPressed();
        },
        child: SizedBox(
          width: 150,
          height: 50,
          child: Center(
            child: Text(text),
          ),
        ),
      ),
    );
  }
}
