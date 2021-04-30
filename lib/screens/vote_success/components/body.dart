import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:mashinno_glasuvane/model/data.dart';
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
          AutoSizeText(
            'Благодарим за вота!',
            style: TextStyle(
              fontSize: getProportionateScreenWidth(300),
              fontWeight: FontWeight.bold,
            ),
            maxLines: 1,
          ),
          SizedBox(
            height: getProportionateScreenHeight(40),
          ),
          DefaultButton(
            text: 'Пробвай пак',
            onPress: () {
              Provider.of<Data>(context, listen: false).clearVote();
              Navigator.pop(context);
            },
            size: getProportionateScreenWidth(200),
            verticalSize: getProportionateScreenHeight(50),
          ),
        ],
      ),
    );
  }
}
