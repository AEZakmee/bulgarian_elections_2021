import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mashinno_glasuvane/constants.dart';
import 'package:mashinno_glasuvane/model/data.dart';
import 'package:mashinno_glasuvane/screens/president_vote/president_vote_screen.dart';
import 'package:mashinno_glasuvane/screens/vote_screen/vote_screen.dart';
import 'package:mashinno_glasuvane/screens/vote_success/vote_success.dart';
import 'package:mashinno_glasuvane/screens/vote_type_screen/vote_type_screen.dart';
import 'package:mashinno_glasuvane/size_config.dart';
import 'package:mashinno_glasuvane/utilities/default_button.dart';
import 'package:provider/provider.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Center(
      child: Container(
        width: getProportionateScreenWidth(320),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: kDefaultColor,
            width: getProportionateScreenWidth(1),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.all(
                getProportionateScreenWidth(10),
              ),
              child: Text(
                'Вие избрахте да гласувате в:',
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(14),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Divider(
              thickness: 1,
              color: kDefaultColor,
            ),
            Padding(
              padding: EdgeInsets.all(
                getProportionateScreenWidth(10),
              ),
              child: Text(
                Provider.of<Data>(context).selectedButtonText,
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(14),
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(
                getProportionateScreenWidth(10),
              ),
              child: Text(
                "Потвърдете своя избор или се върнете назад",
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(13),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(10),
              ),
              child: Row(
                children: [
                  DefaultButton(
                    text: "Връщане назад",
                    onPress: () {
                      Navigator.pushReplacement(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (_, __, ___) => VoteTypeScreen(),
                          transitionDuration: Duration(seconds: 0),
                        ),
                      );
                    },
                    verticalSize: getProportionateScreenHeight(45),
                    size: getProportionateScreenWidth(120),
                  ),
                  Spacer(),
                  DefaultButton(
                    text: "Потвърждам",
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
                    size: getProportionateScreenWidth(120),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(10),
            ),
          ],
        ),
      ),
    );
  }
}
