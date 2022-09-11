import 'package:flutter/material.dart';
import 'package:mashinno_glasuvane/size_config.dart';
import 'package:provider/provider.dart';

import '../../../model/data.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        Provider.of<Data>(context, listen: false).clearVote();
        Navigator.pop(context);
      },
      child: Center(
        child: Container(
          height: SizeConfig.screenHeight,
          width: SizeConfig.screenWidth,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              Icon(
                Icons.check_circle,
                color: Colors.blue,
                size: getProportionateScreenHeight(170),
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
              Center(
                child: Text(
                  'Моля вземете разписката от Вашето гласуване и\nя поставете в картонената кутия за машинно гласуване,\nнамираща се на масата пред членовете на СИК',
                  style: TextStyle(
                    fontSize: getProportionateScreenWidth(11),
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 3,
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(40),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
