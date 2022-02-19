import 'package:flutter/material.dart';
import 'constants.dart';

class ButtonDown extends StatelessWidget {
  final Function onTap;
  final String buttonTitle;
  ButtonDown({@required this.buttonTitle, @required this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: kBottomContainerColor,
        width: double.infinity,
        height: kBottomContainerHeight,
        padding: EdgeInsets.only(bottom: 10.0),
        margin: EdgeInsets.only(top: 10.0),
        child: Center(
          child: Text(
            buttonTitle,
            style: kLargeButtonStyle,
          ),
        ),
      ),
    );
  }
}
