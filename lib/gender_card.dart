import 'package:flutter/material.dart';
import 'constants.dart';

class GenderCard extends StatelessWidget {
  final IconData icon;
  final String gender;
  GenderCard({@required this.icon, @required this.gender});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: icon_size,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          gender,
          style: k_textStyle,
        )
      ],
    );
  }
}
