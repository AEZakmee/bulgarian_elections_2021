import 'package:flutter/material.dart';
import 'package:mashinno_glasuvane/model/political_party.dart';
import 'package:mashinno_glasuvane/model/president.dart';

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
              width: getProportionateScreenWidth(165),
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

class PresidentsRow extends StatelessWidget {
  const PresidentsRow({
    Key key,
    @required this.onPress,
    this.president,
    this.isSelected = false,
  }) : super(key: key);
  final President president;
  final bool isSelected;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionateScreenHeight(43),
      width: double.infinity,
      decoration: BoxDecoration(
        color: (isSelected) ? kDefaultColor : Colors.white,
        border: Border.symmetric(
          horizontal: BorderSide(
            color: kDefaultColor,
            width: getProportionateScreenWidth(0.5),
          ),
        ),
      ),
      child: Row(
        children: [
          SizedBox(
            width: getProportionateScreenWidth(10),
          ),
          Container(
            width: getProportionateScreenWidth(150),
            child: Text(
              president.name,
              overflow: TextOverflow.clip,
              style: TextStyle(
                color: (!isSelected) ? kDefaultColor : Colors.white,
                fontSize: president.name.length < 21
                    ? getProportionateScreenWidth(11)
                    : getProportionateScreenWidth(8),
                fontWeight: FontWeight.w700,
              ),
              maxLines: 2,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(5),
            ),
            child: GestureDetector(
              onTap: onPress,
              child: Container(
                height: getProportionateScreenHeight(35),
                width: getProportionateScreenHeight(35),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: (!isSelected) ? kDefaultColor : Colors.white,
                    width: (!isSelected)
                        ? getProportionateScreenHeight(2)
                        : getProportionateScreenHeight(3),
                  ),
                ),
                child: Center(
                  child: Text(
                    president.number.toString(),
                    style: TextStyle(
                      color: (!isSelected) ? kDefaultColor : Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: getProportionateScreenWidth(13),
                    ),
                    maxLines: 1,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: getProportionateScreenWidth(5),
          ),
          Container(
            width: getProportionateScreenWidth(150),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${president.presidentName}",
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                    color: (!isSelected) ? kDefaultColor : Colors.white,
                    fontSize: getProportionateScreenWidth(11),
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 1,
                ),
                Text(
                  "${president.vicePresidentName}",
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                    color: (!isSelected) ? kDefaultColor : Colors.white,
                    fontSize: getProportionateScreenWidth(11),
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 1,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
