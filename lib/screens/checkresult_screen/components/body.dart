import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mashinno_glasuvane/constants.dart';
import 'package:mashinno_glasuvane/model/data.dart';
import 'package:mashinno_glasuvane/screens/president_vote/president_vote_screen.dart';
import 'package:mashinno_glasuvane/screens/vote_screen/vote_screen.dart';
import 'package:mashinno_glasuvane/screens/vote_success/vote_success.dart';
import 'package:mashinno_glasuvane/size_config.dart';
import 'package:mashinno_glasuvane/utilities/default_button.dart';
import 'package:provider/provider.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    SizeConfig().init(context);
    return Center(
      child: Container(
        width: SizeConfig.screenWidth - getProportionateScreenWidth(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: getProportionateScreenHeight(20),
                  width: double.infinity,
                ),
                Text(
                  "Избори 14.11.2021",
                  style: TextStyle(
                    fontSize: getProportionateScreenWidth(16),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
                Text(
                  "Преглед на избора",
                  style: TextStyle(
                    fontSize: getProportionateScreenWidth(20),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(15),
                ),
                Text(
                  "Прегледайте избора си.",
                  style: TextStyle(
                    fontSize: getProportionateScreenWidth(13),
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(5),
                ),
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                        fontSize: getProportionateScreenWidth(13),
                        color: kDefaultColor),
                    children: <TextSpan>[
                      TextSpan(text: 'Може да го промените, като натиснете '),
                      TextSpan(
                          text: '"Промени избора".',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(5),
                ),
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                      color: kDefaultColor,
                      fontSize: getProportionateScreenWidth(13),
                    ),
                    children: <TextSpan>[
                      TextSpan(text: 'Натиснете '),
                      TextSpan(
                          text: '"Гласувайте" ',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(text: 'и изчакайте разписка.'),
                    ],
                  ),
                ),
              ],
            ),
            Spacer(),
            Container(
              width: getProportionateScreenWidth(320),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: kDefaultColor,
                  width: getProportionateScreenWidth(1),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(
                  getProportionateScreenWidth(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (Provider.of<Data>(context).selectedPresident != null)
                      Column(
                        children: [
                          Text(
                            'Избори за президент и вицепрезидент',
                            style: TextStyle(
                              fontSize: getProportionateScreenWidth(15),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(10),
                          ),
                          Text(
                            '${Provider.of<Data>(context).selectedPresident.number}. ${Provider.of<Data>(context).selectedPresident.name}',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: getProportionateScreenWidth(15),
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(5),
                          ),
                          Text(
                            '${Provider.of<Data>(context).selectedPresident.presidentName}\n ${Provider.of<Data>(context).selectedPresident.vicePresidentName}',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: getProportionateScreenWidth(13),
                            ),
                            maxLines: 2,
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(10),
                          ),
                        ],
                      ),
                    if (Provider.of<Data>(context).selectedParty != null)
                      Column(
                        children: [
                          Text(
                            'Избори за народни представители',
                            style: TextStyle(
                              fontSize: getProportionateScreenWidth(15),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(10),
                          ),
                          Text(
                            '${Provider.of<Data>(context).selectedParty.number}. ${Provider.of<Data>(context).selectedParty.name}',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: getProportionateScreenWidth(15),
                            ),
                            textAlign: TextAlign.center,
                          ),
                          if (Provider.of<Data>(context).selectedParty != null)
                            SizedBox(
                              height: getProportionateScreenHeight(5),
                            ),
                          if (Provider.of<Data>(context).selectedPerson != null)
                            Text(
                              '${Provider.of<Data>(context).selectedPerson.number}. ${Provider.of<Data>(context).selectedPerson.name}',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: getProportionateScreenWidth(13),
                              ),
                              maxLines: 2,
                              textAlign: TextAlign.center,
                            ),
                          SizedBox(
                            height: getProportionateScreenHeight(10),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(10),
                  vertical: getProportionateScreenHeight(10)),
              child: DefaultButton(
                text: "Промени избора",
                onPress: () {
                  if (Provider.of<Data>(context, listen: false)
                          .selectedVoteType ==
                      2) {
                    Navigator.pushReplacement(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (_, __, ___) => VoteScreen(),
                        transitionDuration: Duration(seconds: 0),
                      ),
                    );
                  } else {
                    Navigator.pushReplacement(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (_, __, ___) => PresidentScreen(),
                        transitionDuration: Duration(seconds: 0),
                      ),
                    );
                  }
                },
                verticalSize: getProportionateScreenHeight(45),
                size: getProportionateScreenWidth(320),
              ),
            ),
            Spacer(),
            Row(
              children: [
                Spacer(),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(5),
                    vertical: getProportionateScreenWidth(20),
                  ),
                  child: DefaultButton(
                    text: 'Гласуване',
                    onPress: () {
                      Provider.of<Data>(context, listen: false).clearVote();
                      Navigator.pushReplacement(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (_, __, ___) => VoteSuccessWindow(),
                          transitionDuration: Duration(seconds: 0),
                        ),
                      );
                    },
                    verticalSize: getProportionateScreenHeight(50),
                    size: getProportionateScreenWidth(160),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
          ],
        ),
      ),
    );
  }
}
