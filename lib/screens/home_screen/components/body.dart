import 'package:flutter/material.dart';
import 'package:mashinno_glasuvane/model/data.dart';
import 'package:mashinno_glasuvane/screens/vote_screen/vote_screen.dart';
import 'package:mashinno_glasuvane/size_config.dart';
import 'package:mashinno_glasuvane/utilities/default_button.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  _launchURL() async {
    const url = 'https://www.linkedin.com/in/kristiyan-t99';
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: true,
        forceWebView: true,
        webOnlyWindowName: '_blank',
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchURLAndroid() async {
    const url = 'https://linkedin.com/in/kristiyan-t99';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Container(
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
              verticalSize: getProportionateScreenHeight(100),
            ),
            Spacer(),
            // Text(
            //   "Системата е създадена изцяло с идеята, да покаже на хората процеса при машинно гласуване.\nСистемата НЯМА за цел, да агитира или подкрепя дадена политическа партия.\nСистемата НЯМА НИЩО ОБЩО с изборите и централната избирателна комисия",
            //   style: TextStyle(
            //       fontSize: getProportionateScreenWidth(12),
            //       color: Colors.grey),
            //   textAlign: TextAlign.left,
            // ),
            SizedBox(
              height: getProportionateScreenHeight(40),
            ),
            Row(
              children: [
                Spacer(),
                Padding(
                  padding: EdgeInsets.only(
                    right: getProportionateScreenWidth(5),
                  ),
                  child: InkWell(
                    onTap: _launchURLAndroid,
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: getProportionateScreenWidth(13),
                          color: Colors.grey,
                          fontWeight: FontWeight.w700,
                        ),
                        children: [
                          TextSpan(text: 'Created by '),
                          TextSpan(
                            text: 'Kristiyan Tsankov',
                            style: TextStyle(color: Colors.blue),
                          )
                        ],
                      ),
                    ),
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
    );
  }
}
