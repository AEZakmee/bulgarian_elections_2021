import 'package:flutter/material.dart';
import 'package:mashinno_glasuvane/constants.dart';
import 'package:mashinno_glasuvane/model/data.dart';
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Icon(
              Icons.check_circle,
              color: Colors.lightBlue,
              size: getProportionateScreenHeight(150),
            ),
            SizedBox(
              height: getProportionateScreenHeight(30),
            ),
            Text(
              "Разписката е готова",
              style: TextStyle(
                fontSize: getProportionateScreenWidth(26),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            Text(
              "Моля, вземете разписката от Вашето гласуване и я поставете в картонената кутия за машинно гласуване, намираща се на масата пред членовете на СИК.",
              style: TextStyle(
                fontSize: getProportionateScreenWidth(14),
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
              maxLines: 5,
            ),
            Spacer(),
            DefaultButton(
              text: 'Гласувай пак',
              onPress: () {
                Provider.of<Data>(context, listen: false).clearVote();
                Navigator.pop(context);
              },
              size: getProportionateScreenWidth(200),
              verticalSize: getProportionateScreenHeight(50),
            ),
            SizedBox(
              height: getProportionateScreenHeight(10),
            ),
            // Center(
            //   child: Text(
            //     'Вие гласувахте успешно!',
            //     style: TextStyle(
            //       fontSize: getProportionateScreenWidth(25),
            //       fontWeight: FontWeight.bold,
            //     ),
            //     maxLines: 1,
            //   ),
            // ),
            // SizedBox(
            //   height: getProportionateScreenHeight(20),
            // ),
            // Center(
            //   child: Text(
            //     'Вземете разписката, сгънете я на две!\nСлед което я пуснете в непрозрачната кутия пред комисията.',
            //     style: TextStyle(
            //       fontSize: getProportionateScreenWidth(9.5),
            //       fontWeight: FontWeight.bold,
            //     ),
            //     textAlign: TextAlign.center,
            //     maxLines: 3,
            //   ),
            // ),
            // SizedBox(
            //   height: getProportionateScreenHeight(40),
            // ),
            // DefaultButton(
            //   text: 'Гласувай пак',
            //   onPress: () {
            //     Provider.of<Data>(context, listen: false).clearVote();
            //     Navigator.pop(context);
            //   },
            //   size: getProportionateScreenWidth(200),
            //   verticalSize: getProportionateScreenHeight(50),
            // ),
          ],
        ),
      ),
    );
  }
}
