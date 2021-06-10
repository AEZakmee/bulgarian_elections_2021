import 'package:flutter/material.dart';
import 'package:mashinno_glasuvane/model/political_party.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class PartyRow extends StatelessWidget {
  const PartyRow({
    Key key,
    @required this.party,
    this.isSelectedParty = false,
    @required this.onPress,
  }) : super(key: key);
  final PoliticalParty party;
  final bool isSelectedParty;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionateScreenHeight(43),
      width: double.infinity,
      decoration: BoxDecoration(
        color: (isSelectedParty) ? kDefaultColor : Colors.white,
        border: Border.symmetric(
          horizontal: BorderSide(
            color: kDefaultColor,
            width: getProportionateScreenWidth(0.5),
          ),
        ),
      ),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(3),
            ),
            child: GestureDetector(
              onTap: onPress,
              child: Container(
                height: getProportionateScreenHeight(35),
                width: getProportionateScreenHeight(35),
                decoration: BoxDecoration(
                  border: Border.all(
                      color: (!isSelectedParty) ? kDefaultColor : Colors.white,
                      width: (!isSelectedParty)
                          ? getProportionateScreenHeight(2)
                          : getProportionateScreenHeight(3)),
                ),
                child: Center(
                  child: Text(
                    party.number.toString(),
                    style: TextStyle(
                      color: (!isSelectedParty) ? kDefaultColor : Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: getProportionateScreenWidth(13),
                    ),
                    maxLines: 1,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: getProportionateScreenWidth(5),
            ),
            child: Container(
              width: getProportionateScreenWidth(180),
              child: Text(
                party.name,
                style: TextStyle(
                  color: (!isSelectedParty) ? kDefaultColor : Colors.white,
                  fontSize: getProportionateScreenWidth(10),
                  fontWeight: FontWeight.w700,
                ),
                maxLines: 2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
