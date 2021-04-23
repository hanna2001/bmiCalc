import 'constants.dart';
import 'package:flutter/material.dart';
import 'r_card.dart';
import 'bottom_container.dart';

class OutputPage extends StatelessWidget {
  final bmi;
  final state;
  final comment;
  OutputPage({this.bmi, this.state, this.comment});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BMI Calculator')),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(25, 10, 0, 10),
              child: Text(
                'Your Result',
                style: k_BotTextStyle,
              ),
            ),
            Expanded(
              child: RCard(
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      state.toString(),
                      style: k_stateTextStyle,
                    ),
                    Text(
                      bmi.toString(),
                      style: k_numbStyle,
                    ),
                    Text(
                      comment,
                      style: k_CommTextStyle,
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
                colour: k_ActCardClr,
              ),
            ),
            BottomContainer(
              title: 'RE-CALCULATE',
              nextPage: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
