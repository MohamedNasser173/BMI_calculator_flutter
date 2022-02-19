import 'package:flutter/material.dart';
import 'constants.dart';

class IconContent extends StatelessWidget {
  IconContent(this.text);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //Icon() .............................................add icon
        Text(
          text,
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}
