import 'package:flutter/material.dart';
import 'package:mashinno_glasuvane/constants.dart';
import 'package:mashinno_glasuvane/model/data.dart';
import 'package:mashinno_glasuvane/screens/vote_screen/vote_screen.dart';
import 'package:mashinno_glasuvane/screens/vote_success/vote_success.dart';
import 'package:mashinno_glasuvane/size_config.dart';
import 'package:mashinno_glasuvane/utilities/default_button.dart';
import 'package:provider/provider.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Center(
      child: Container(
        height: SizeConfig.screenHeight,
        width: SizeConfig.screenWidth,
        child: Column(
          children: [
            SizedBox(
              height: getProportionateScreenHeight(15),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: double.infinity,
                ),
                Text(
                  'Преглед на избора',
                  style: TextStyle(
                    fontSize: getProportionateScreenWidth(16),
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.start,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Прегледайте избора си.',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: getProportionateScreenWidth(11),
                  ),
                  textAlign: TextAlign.start,
                ),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(text: 'Може да го промените, като натиснете '),
                      TextSpan(
                        text: '"Промени избора"',
                        style: TextStyle(
                          fontSize: getProportionateScreenWidth(12),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: getProportionateScreenWidth(11),
                  ),
                ),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(text: 'Натиснете '),
                      TextSpan(
                        text: '"Гласуване"',
                        style: TextStyle(
                          fontSize: getProportionateScreenWidth(12),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(text: ' и изчакайте разписка.'),
                    ],
                  ),
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: getProportionateScreenWidth(11),
                  ),
                )
              ],
            ),
            Spacer(),
            ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: getProportionateScreenWidth(250),
                maxWidth: getProportionateScreenWidth(250),
                minHeight: getProportionateScreenHeight(200),
              ),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: kDefaultColor,
                    width: getProportionateScreenWidth(2),
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: getProportionateScreenHeight(15),
                    ),
                    Text(
                      '000000274',
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(13),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(10),
                        vertical: getProportionateScreenHeight(8),
                      ),
                      child: Divider(
                        thickness: getProportionateScreenHeight(1),
                        color: kDefaultColor,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Избори за народни представители',
                            style: TextStyle(
                              fontSize: getProportionateScreenWidth(12),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(8),
                          ),
                          if (Provider.of<Data>(context).selectedParty != null)
                            IntrinsicHeight(
                              child: Row(
                                children: [
                                  Container(
                                    height: getProportionateScreenHeight(11),
                                    width: getProportionateScreenHeight(11),
                                    color: kDefaultColor,
                                  ),
                                  SizedBox(
                                    width: getProportionateScreenHeight(20),
                                  ),
                                  ConstrainedBox(
                                    constraints: BoxConstraints(
                                      maxWidth: getProportionateScreenWidth(
                                        200,
                                      ),
                                    ),
                                    child: Text(
                                      '${Provider.of<Data>(context).selectedParty.number}. ${Provider.of<Data>(context).selectedParty.name}',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: getProportionateScreenWidth(
                                          12,
                                        ),
                                      ),
                                      textAlign: TextAlign.start,
                                    ),
                                  ),
                                  SizedBox(
                                    width: getProportionateScreenHeight(5),
                                  ),
                                ],
                              ),
                            ),
                          SizedBox(
                            height: getProportionateScreenHeight(10),
                          ),
                          if (Provider.of<Data>(context).selectedPerson != null)
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: getProportionateScreenHeight(5),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        color: kDefaultColor,
                                        width: getProportionateScreenHeight(1),
                                        height:
                                            getProportionateScreenHeight(10),
                                      ),
                                      Container(
                                        color: kDefaultColor,
                                        width: getProportionateScreenWidth(20),
                                        height: getProportionateScreenHeight(1),
                                      ),
                                      SizedBox(
                                        height: getProportionateScreenHeight(9),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: getProportionateScreenWidth(10),
                                ),
                                ConstrainedBox(
                                  constraints: BoxConstraints(
                                    maxWidth: getProportionateScreenWidth(
                                      190,
                                    ),
                                  ),
                                  child: Text(
                                    '${Provider.of<Data>(context).selectedPerson.number}. ${Provider.of<Data>(context).selectedPerson.name}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: getProportionateScreenWidth(12),
                                    ),
                                    maxLines: 2,
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                              ],
                            ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(15),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(10),
            ),
            DefaultButton(
              text: 'Промени избор',
              onPress: () {
                Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (_, __, ___) => VoteScreen(),
                    transitionDuration: Duration(seconds: 0),
                  ),
                );
              },
              size: getProportionateScreenWidth(250),
              verticalSize: getProportionateScreenHeight(50),
            ),
            Spacer(),
            Row(
              children: [
                Spacer(),
                DefaultButton(
                  text: 'Гласуване',
                  onPress: () {
                    Provider.of<Data>(context, listen: false).clearVote();
                    Provider.of<Data>(context, listen: false).firstPage();
                    Navigator.popAndPushNamed(
                      context,
                      VoteSuccessWindow.routeName,
                    );
                  },
                  verticalSize: getProportionateScreenHeight(40),
                  size: getProportionateScreenWidth(200),
                ),
              ],
            ),
            SizedBox(
              height: getProportionateScreenHeight(15),
            ),
          ],
        ),
      ),
    );
  }
}
