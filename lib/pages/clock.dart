import 'package:flutter/material.dart';

class ClockPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ClockPageState();
}

class _ClockPageState extends State<ClockPage> {
  DateTime _firstClickTime;
  int _clickCount = 0;
  int _remainingSeconds;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      // Displays how many clicks were done in the last time window
      Text("Click count: $_clickCount"),

      // Displays how many seconds to the next time window
      Text(_remainingSeconds == null
          ? "Ok"
          : "Hey, wait $_remainingSeconds seconds before clicking!"),

      // The button the user should click
      TextButton(
        onPressed: () {
          final DateTime now = DateTime.now();

          // If the first click is not defined, define it right now!
          if (_firstClickTime == null) {
            _firstClickTime = now;
          }

          // Calculate the time difference between now and the
          // first time the button was clicked
          final Duration diff = now.difference(_firstClickTime);

          // If this difference is less than five seconds
          if (diff.inSeconds < 5) {
            // If the click count has reach its maximum (5 clicks)
            if (_clickCount == 5) {
              // Don't increase the click count, display to the
              // user how many seconds he has left to click again
              setState(() => _remainingSeconds = 5 - diff.inSeconds);
            } else {
              setState(() {
                // Remove the remaining seconds message
                _remainingSeconds = null;

                // Increment the click count since it's within
                // the allowed time difference
                _clickCount++;
              });
            }

            // If it's greater than five seconds
          } else {
            // Reset the first time the button was clicked and
            // the click count, so the user can click it again
            _firstClickTime = null;
            _clickCount = 0;
          }
        },
        child: Text("Click me!"),
      )
    ]);
  }
}
