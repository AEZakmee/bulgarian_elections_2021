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
    return GestureDetector(
      onTap: onPress,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: getProportionateScreenHeight(37.5),
            width: double.infinity,
            decoration: BoxDecoration(
              color: (isSelectedParty) ? kDefaultColor : Colors.white,
            ),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(3),
                  ),
                  child: Container(
                    height: getProportionateScreenHeight(29),
                    width: getProportionateScreenHeight(29),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color:
                              (!isSelectedParty) ? kDefaultColor : Colors.white,
                          width: (!isSelectedParty)
                              ? getProportionateScreenHeight(1)
                              : getProportionateScreenHeight(2)),
                    ),
                    child: Center(
                      child: Text(
                        party.number.toString(),
                        style: TextStyle(
                          color:
                              (!isSelectedParty) ? kDefaultColor : Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: getProportionateScreenWidth(11),
                        ),
                        maxLines: 1,
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
                        color:
                            (!isSelectedParty) ? kDefaultColor : Colors.white,
                        fontSize: getProportionateScreenWidth(10),
                        fontWeight: FontWeight.w700,
                      ),
                      maxLines: 2,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: kDefaultColor,
            width: double.infinity,
            height: getProportionateScreenWidth(0.5),
          )
        ],
      ),
    );
  }
}
