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
    return Center(
      child: SafeArea(
        child: Container(
          width: SizeConfig.screenWidth - getProportionateScreenWidth(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: getProportionateScreenHeight(30),
              ),
              Text(
                "Парламентарни избори\nСимулатор",
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
                verticalSize: getProportionateScreenHeight(100),
              ),
              Spacer(),
              Text(
                "Системата е създадена изцяло с идеята да покаже на хората процеса при машинно гласуване.\nСистемата НЯМА за цел да агитира или подкрепя дадена политическа партия.\nСистемата НЯМА НИЩО ОБЩО с изборите и Централната избирателна комисия",
                style: TextStyle(
                    fontSize: getProportionateScreenWidth(12),
                    color: Colors.grey),
                textAlign: TextAlign.left,
              ),
              SizedBox(
                height: getProportionateScreenHeight(50),
                width: double.infinity,
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
