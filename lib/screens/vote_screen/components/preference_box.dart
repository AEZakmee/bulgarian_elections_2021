import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class PreferenceBox extends StatelessWidget {
  const PreferenceBox({
    Key key,
    @required this.number,
    @required this.onPress,
    @required this.isSelectedBox,
    this.clickable = false,
  }) : super(key: key);
  final int number;
  final Function onPress;
  final bool isSelectedBox;
  final bool clickable;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: clickable ? onPress : null,
      child: Container(
        decoration: BoxDecoration(
          color: isSelectedBox ? kDefaultColor : Colors.white,
          shape: BoxShape.circle,
          border: Border.all(
              color: clickable ? kDefaultColor : Colors.grey,
              width: getProportionateScreenWidth(1.5)),
        ),
        padding: EdgeInsets.all(
          getProportionateScreenWidth(5.5),
        ),
        child: Text(
          (101 + number).toString(),
          style: TextStyle(
            color: !clickable
                ? Colors.grey.shade600
                : isSelectedBox
                    ? Colors.white
                    : kDefaultColor,
            fontWeight: FontWeight.bold,
            fontSize: getProportionateScreenWidth(12.6),
          ),
        ),
      ),
    );
  }
}
