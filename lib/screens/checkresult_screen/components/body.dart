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
            Spacer(),
            Container(
              height: getProportionateScreenHeight(200),
              width: getProportionateScreenWidth(250),
              decoration: BoxDecoration(
                border: Border.all(
                  color: kDefaultColor,
                  width: getProportionateScreenWidth(2),
                ),
              ),
              child: Column(
                children: [
                  Spacer(
                    flex: 1,
                  ),
                  Text(
                    'Вашият избор',
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(15),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(10),
                    ),
                    child: Divider(
                      thickness: getProportionateScreenHeight(1),
                      color: kDefaultColor,
                    ),
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (Provider.of<Data>(context).selectedParty != null)
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: getProportionateScreenWidth(2),
                          ),
                          child: Text(
                            '${Provider.of<Data>(context).selectedParty.number}. ${Provider.of<Data>(context).selectedParty.name}',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: getProportionateScreenWidth(16),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      SizedBox(
                        height: getProportionateScreenHeight(5),
                      ),
                      if (Provider.of<Data>(context).selectedPerson != null)
                        Text(
                          '    ${Provider.of<Data>(context).selectedPerson.number}. ${Provider.of<Data>(context).selectedPerson.name}',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: getProportionateScreenWidth(13),
                          ),
                        ),
                    ],
                  ),
                  Spacer(
                    flex: 2,
                  ),
                ],
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
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(5),
                    vertical: getProportionateScreenWidth(20),
                  ),
                  child: DefaultButton(
                    text: 'Гласуване',
                    onPress: () {
                      Provider.of<Data>(context, listen: false).clearVote();
                      Provider.of<Data>(context, listen: false).firstPage();
                      Navigator.popAndPushNamed(
                          context, VoteSuccessWindow.routeName);
                    },
                    verticalSize: getProportionateScreenHeight(50),
                    size: getProportionateScreenWidth(160),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
