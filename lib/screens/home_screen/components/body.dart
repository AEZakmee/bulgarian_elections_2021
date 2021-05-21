import 'package:flutter/material.dart';
import 'package:mashinno_glasuvane/model/data.dart';
import 'package:mashinno_glasuvane/screens/vote_screen/vote_screen.dart';
import 'package:mashinno_glasuvane/size_config.dart';
import 'package:mashinno_glasuvane/utilities/default_button.dart';
import 'package:provider/provider.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SingleChildScrollView(
      child: Center(
        child: Container(
          height: SizeConfig.screenHeight,
          width: SizeConfig.screenWidth,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: getProportionateScreenHeight(30),
              ),
              Text(
                "Реплика машинно гласуване. \nБългария 2021",
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(30),
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
                maxLines: 3,
              ),
              Spacer(),
              DefaultButton(
                text: 'Гласувай',
                onPress: () {
                  Provider.of<Data>(context, listen: false).clearVote();
                  Provider.of<Data>(context, listen: false).firstPage();
                  Navigator.pushNamed(context, VoteScreen.routeName);
                },
                size: getProportionateScreenWidth(300),
                verticalSize: getProportionateScreenHeight(150),
              ),
              Spacer(),
              Text(
                "Системата е създадена изцяло с идеята, да покаже на хората процеса при машинно гласуване.\nСистемата НЯМА за цел, да агитира или подпомага дадена политическа партия.\nСистемата НЯМА НИЩО ОБЩО с изборите и централната избирателна комисия",
                style: TextStyle(
                    fontSize: getProportionateScreenWidth(12),
                    color: Colors.grey),
                textAlign: TextAlign.left,
              ),
              SizedBox(
                height: getProportionateScreenHeight(20),
              ),
              Row(
                children: [
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.only(
                      right: getProportionateScreenWidth(5),
                    ),
                    child: Text(
                      "Създадено от Кристиян Цанков",
                      style: TextStyle(
                          fontSize: getProportionateScreenWidth(12),
                          color: Colors.grey),
                      textAlign: TextAlign.right,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: getProportionateScreenHeight(10),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
