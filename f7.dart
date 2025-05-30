import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stopwatch App',
      debugShowCheckedModeBanner: false,
      home: StopwatchPage(),
    );
  }
}

class StopwatchPage extends StatefulWidget {
  @override
  _StopwatchPageState createState() => _StopwatchPageState();
}

class _StopwatchPageState extends State<StopwatchPage> {
  Stopwatch _stopwatch = Stopwatch();
  Timer? _timer;

  String _formatTime(int milliseconds) {
    var seconds = (milliseconds / 1000).truncate();
    var minutes = (seconds / 60).truncate();
    seconds = seconds % 60;
    var ms = (milliseconds % 1000) ~/ 10;
    return '$minutes:${seconds.toString().padLeft(2, '0')}.${ms.toString().padLeft(2, '0')}';
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(milliseconds: 30), (timer) {
      setState(() {});
    });
  }

  void _startStopwatch() {
    _stopwatch.start();
    _startTimer();
  }

  void _stopStopwatch() {
    _stopwatch.stop();
    _timer?.cancel();
  }

  void _resetStopwatch() {
    _stopwatch.reset();
    setState(() {});
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Stopwatch")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _formatTime(_stopwatch.elapsedMilliseconds),
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _stopwatch.isRunning
                      ? _stopStopwatch
                      : _startStopwatch,
                  child: Text(_stopwatch.isRunning ? "Stop" : "Start"),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: _resetStopwatch,
                  child: Text("Reset"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
