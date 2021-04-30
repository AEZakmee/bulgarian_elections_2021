import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:mashinno_glasuvane/constants.dart';

import '../size_config.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key key,
    @required this.text,
    @required this.onPress,
    this.color = kDefaultColor,
    this.size = 100,
    this.verticalSize = 30,
    this.textColor = Colors.white,
  }) : super(key: key);
  final String text;
  final Function onPress;
  final Color color;
  final Color textColor;
  final double size;
  final double verticalSize;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: verticalSize,
      child: Material(
        color: color,
        elevation: 5,
        borderRadius: BorderRadius.circular(10),
        child: MaterialButton(
          child: AutoSizeText(
            text,
            style: TextStyle(
              color: textColor,
              fontSize: verticalSize / 2,
            ),
            maxFontSize: 100,
            minFontSize: 1,
            maxLines: 1,
          ),
          onPressed: onPress,
        ),
      ),
    );
  }
}

class DefaultEmptyButton extends StatelessWidget {
  const DefaultEmptyButton({
    Key key,
    @required this.text,
    @required this.onPress,
    this.color = Colors.white,
    this.size = 100,
    this.verticalSize = 30,
    this.textColor = kDefaultColor,
  }) : super(key: key);
  final String text;
  final Function onPress;
  final Color color;
  final Color textColor;
  final double size;
  final double verticalSize;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        height: verticalSize,
        width: size,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: kDefaultColor),
        ),
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: textColor,
              fontSize: verticalSize / 2.5,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ),
    );
  }
}
