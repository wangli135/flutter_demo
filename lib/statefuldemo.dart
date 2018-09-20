import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  @override
  State createState() {
    return new _CounterState();
  }
}

class _CounterState extends State<Counter> {
  int _counter = 0;

  void _increment() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        CounterIncrementor(_increment),
        CounterDisplay(_counter),
      ],
    );
  }
}

class CounterDisplay extends StatelessWidget {
  final int count;

  CounterDisplay(this.count);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Count:$count',
      textDirection: TextDirection.ltr,
    );
  }
}

class CounterIncrementor extends StatelessWidget {
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: onPressed,
      child: Text(
        'Increment',
        textDirection: TextDirection.ltr,
      ),
    );
  }

  CounterIncrementor(this.onPressed);
}
