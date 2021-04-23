import 'package:flutter/material.dart';
import 'constants.dart';

class RCard extends StatelessWidget {
  final Color colour;
  final Widget cardChild;
  final Function onPress;
  RCard({@required this.colour, this.cardChild, this.onPress});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(k_margin),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
