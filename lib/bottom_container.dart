import 'package:flutter/material.dart';
import 'constants.dart';

class BottomContainer extends StatelessWidget {
  final String title;
  final Function nextPage;
  BottomContainer({@required this.title, this.nextPage});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: nextPage,
      child: Container(
        child: Center(
          child: Text(
            title,
            style: k_BotTextStyle,
          ),
        ),
        color: k_bot_slid_ConClr,
        padding: EdgeInsets.only(bottom: 10),
        margin: EdgeInsets.only(top: k_margin),
        height: k_botConH,
        width: double.infinity,
      ),
    );
  }
}
