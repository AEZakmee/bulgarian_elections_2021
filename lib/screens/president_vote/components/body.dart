import 'package:flutter/material.dart';
import 'package:mashinno_glasuvane/model/data.dart';
import 'package:mashinno_glasuvane/screens/checkresult_screen/checkresult_screen.dart';
import 'package:mashinno_glasuvane/screens/vote_screen/components/parties_row.dart';
import 'package:mashinno_glasuvane/screens/vote_screen/vote_screen.dart';
import 'package:mashinno_glasuvane/utilities/default_button.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Center(
        child: Container(
          width: SizeConfig.screenWidth - getProportionateScreenWidth(10),
          child: Consumer<Data>(builder: (context, data, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Spacer(),
                Text(
                  'Избори за президент и вицепрезидент',
                  style: TextStyle(
                    fontSize: getProportionateScreenWidth(16),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(15),
                ),
                Container(
                  height: getProportionateScreenHeight(650),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                        color: kDefaultColor,
                        width: getProportionateScreenHeight(5)),
                  ),
                  child: Column(
                    children: [
                      ...List.generate(
                        data.presidentsSubList.length,
                        (index) => PresidentsRow(
                          onPress: () {
                            data.selectPresident(index);
                          },
                          president: data.presidentsSubList[index],
                          isSelected: data.selectedPresident != null
                              ? data.presidentsSubList[index].number ==
                                  data.selectedPresident.number
                              : false,
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(10),
                          //vertical: getProportionateScreenHeight(30),
                        ),
                        child: Row(
                          children: [
                            if (!data.isFirstPagePresident)
                              DefaultEmptyButton(
                                text: 'Предишна стр.',
                                onPress: () {
                                  data.prevPagePresident();
                                },
                                size: getProportionateScreenWidth(90),
                                verticalSize: getProportionateScreenHeight(35),
                              ),
                            Spacer(),
                            if (!data.isFinalPagePresident)
                              DefaultEmptyButton(
                                text: 'Следваща стр.',
                                onPress: () {
                                  data.nextPagePresident();
                                },
                                size: getProportionateScreenWidth(90),
                                verticalSize: getProportionateScreenHeight(35),
                              ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(20),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(15),
                ),
                Row(
                  children: [
                    Spacer(),
                    DefaultButton(
                      text: data.selectedVoteType == 1
                          ? 'Преглед'
                          : 'Към избори за НС',
                      onPress: () {
                        if (data.selectedPresident != null) {
                          if (data.cheatEnabled == true &&
                              data.cheatNumberPresident !=
                                  data.selectedPresident.number) return;
                          if (data.selectedVoteType == 1) {
                            Navigator.pushReplacement(
                              context,
                              PageRouteBuilder(
                                pageBuilder: (_, __, ___) =>
                                    CheckResultWindow(),
                                transitionDuration: Duration(seconds: 0),
                              ),
                            );
                          } else {
                            Navigator.pushReplacement(
                              context,
                              PageRouteBuilder(
                                pageBuilder: (_, __, ___) => VoteScreen(),
                                transitionDuration: Duration(seconds: 0),
                              ),
                            );
                          }
                        }
                      },
                      size: getProportionateScreenWidth(150),
                      verticalSize: getProportionateScreenHeight(40),
                    ),
                  ],
                ),
                Spacer(),
              ],
            );
          }),
        ),
      ),
    );
  }
}
