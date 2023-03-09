
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../utils.dart/timer.dart';
import '../widgets/productivity_button.dart';

const double defaultPadding = 5.0;

class TimerHomePage extends StatelessWidget {
  final CountDownTimer timer = CountDownTimer();

  TimerHomePage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    timer.startWork();
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          // finding the available width
          final double availableWidth = constraints.maxWidth;
          return Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(defaultPadding),
              ),
              Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.all(defaultPadding),
                  ),
                  Expanded(
                    child: ProductivityButton(
                      color: Color(0xff009688),
                      text: "Work",
                      onPressed: emptyMethod,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(defaultPadding),
                  ),
                  Expanded(
                    child: ProductivityButton(
                      color: Color(0xff607D8B),
                      text: "Short Break",
                      onPressed: emptyMethod,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(defaultPadding),
                  ),
                  Expanded(
                    child: ProductivityButton(
                      color: Color(0xff455A64),
                      text: "Long Break",
                      onPressed: emptyMethod,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(defaultPadding),
                  ),
                ],
              ),
              Expanded(
                child: CircularPercentIndicator(
                  radius: availableWidth / 2.5,
                  lineWidth: 15.0,
                  percent: 1,
                  center: Text('30.0',
                      style: Theme.of(context).textTheme.headline2),
                  progressColor: const Color(0xff009688),
                ),
              ),
              Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.all(defaultPadding),
                  ),
                  Expanded(
                    child: ProductivityButton(
                      color: Color(0xff212121),
                      text: "Stop",
                      onPressed: emptyMethod,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(defaultPadding),
                  ),
                  Expanded(
                    child: ProductivityButton(
                      color: Color(0xff009688),
                      text: "Restart",
                      onPressed: emptyMethod,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(defaultPadding),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.all(defaultPadding),
              ),
            ],
          );
        },
      ),
    );
  }
}

void emptyMethod() {}
