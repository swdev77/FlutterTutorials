import 'package:flutter/material.dart';

void main() => runApp(AppWidget());

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello world project',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Hello world App'),
        ),
        body: const Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
