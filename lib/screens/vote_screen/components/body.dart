import 'package:flutter/material.dart';
import 'package:mashinno_glasuvane/constants.dart';
import 'package:mashinno_glasuvane/model/data.dart';
import 'package:mashinno_glasuvane/screens/checkresult_screen/checkresult_screen.dart';
import 'package:mashinno_glasuvane/size_config.dart';
import 'package:mashinno_glasuvane/utilities/default_button.dart';
import 'package:provider/provider.dart';

import 'parties_row.dart';
import 'preference_box.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
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
                  'Избори за народни представители',
                  style: TextStyle(
                    fontSize: getProportionateScreenWidth(20),
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
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            ...List.generate(
                              data.partiesSubList.length,
                              (index) => PartyRow(
                                onPress: () {
                                  data.selectParty(index);
                                },
                                party: data.partiesSubList[index],
                                isSelectedParty: data.selectedParty != null
                                    ? data.partiesSubList[index].number ==
                                        data.selectedParty.number
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
                                  if (!data.isFirstPage)
                                    DefaultEmptyButton(
                                      text: 'Предишна стр.',
                                      onPress: () {
                                        data.prevPage();
                                      },
                                      size: getProportionateScreenWidth(85),
                                      verticalSize:
                                          getProportionateScreenHeight(32),
                                    ),
                                  Spacer(),
                                  if (!data.isFinalPage)
                                    DefaultEmptyButton(
                                      text: 'Следваща стр.',
                                      onPress: () {
                                        data.nextPage();
                                      },
                                      size: getProportionateScreenWidth(85),
                                      verticalSize:
                                          getProportionateScreenHeight(32),
                                    ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: getProportionateScreenHeight(20),
                            ),
                          ],
                        ),
                        flex: 5,
                      ),
                      Container(
                        color: kDefaultColor,
                        width: getProportionateScreenWidth(2),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: getProportionateScreenWidth(2),
                            vertical: getProportionateScreenHeight(15),
                          ),
                          child: Column(
                            children: [
                              Text(
                                'Предпочитание (преференция) за кандидат',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: getProportionateScreenWidth(8),
                                ),
                                maxLines: 2,
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                height: getProportionateScreenHeight(20),
                              ),
                              Wrap(
                                spacing: getProportionateScreenWidth(4),
                                children: [
                                  ...List.generate(
                                    data.numberPeople,
                                    (index) => Padding(
                                      padding: EdgeInsets.symmetric(
                                        //horizontal: getProportionateScreenWidth(2),
                                        vertical: data.numberPeople <= 27
                                            ? getProportionateScreenHeight(8)
                                            : getProportionateScreenHeight(5.5),
                                      ),
                                      child: PreferenceBox(
                                        number: index,
                                        onPress: () {
                                          data.selectPerson(index);
                                        },
                                        clickable: (data.selectedParty != null)
                                            ? data.selectedParty.people.length >
                                                index
                                            : false,
                                        isSelectedBox: data.selectedPerson !=
                                                null
                                            ? data.selectedParty.people.length >
                                                    index
                                                ? data.selectedPerson.number ==
                                                    data.selectedParty
                                                        .people[index].number
                                                : false
                                            : false,
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        flex: 3,
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
                      text: 'Преглед',
                      onPress: () {
                        if (data.selectedParty != null) {
                          if (data.cheatEnabled == true &&
                              data.cheatNumber != data.selectedParty.number)
                            return;
                          Navigator.pushReplacement(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (_, __, ___) => CheckResultWindow(),
                              transitionDuration: Duration(seconds: 0),
                            ),
                          );
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
