import 'package:flutter/material.dart';
import 'package:mashinno_glasuvane/model/data.dart';
import 'package:mashinno_glasuvane/screens/vote_screen/vote_screen.dart';
import 'package:mashinno_glasuvane/size_config.dart';
import 'package:mashinno_glasuvane/utilities/default_button.dart';
import 'package:provider/provider.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DefaultButton(
            text: 'Гласувай',
            onPress: () {
              Provider.of<Data>(context, listen: false).clearVote();
              Provider.of<Data>(context, listen: false).firstPage();
              Navigator.pushNamed(context, VoteScreen.routeName);
            },
            size: getProportionateScreenWidth(200),
            verticalSize: 100,
          ),
        ],
      ),
    );
  }
}
