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
                "Парламентарни избори\nБългария 2021\nРеплика",
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(25),
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
                maxLines: 4,
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
                "Системата е създадена изцяло с идеята, да покаже на хората процеса при машинно гласуване.\nСистемата НЯМА за цел, да агитира или подкрепя дадена политическа партия.\nСистемата НЯМА НИЩО ОБЩО с изборите и централната избирателна комисия",
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
                      "Created by Kristiyan Tsankov",
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(10),
                        color: Colors.grey,
                        fontWeight: FontWeight.w700,
                      ),
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
