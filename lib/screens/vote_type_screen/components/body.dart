import 'package:flutter/material.dart';
import 'package:mashinno_glasuvane/model/data.dart';
import 'package:mashinno_glasuvane/screens/check_selected_type/check_selected_type_screen.dart';
import 'package:mashinno_glasuvane/utilities/default_button.dart';
import 'package:provider/provider.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Center(
        child: Container(
          width: SizeConfig.screenWidth - getProportionateScreenWidth(10),
          height: SizeConfig.screenHeight,
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: getProportionateScreenHeight(20),
                    width: double.infinity,
                  ),
                  Text(
                    "Избори 14.11.2021",
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(16),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(20),
                  ),
                  Text(
                    "Посочете в кои избори ще гласувате",
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(18),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(15),
                  ),
                  Text(
                    "Натиснете и потвърдете",
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(14),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: getProportionateScreenHeight(100),
              ),
              Consumer<Data>(builder: (context, data, child) {
                return Column(
                  children: [
                    ...List.generate(
                      data.buttonTypes.length,
                      (index) => ChooseVoteBox(
                        isChecked: data.selectedVoteType == index,
                        isTapped: () => data.selectedVoteType = index,
                        text: data.buttonTypes[index],
                      ),
                    ),
                  ],
                );
              }),
              Spacer(),
              Row(
                children: [
                  Spacer(),
                  DefaultEmptyButton(
                    text: 'Потвърждавам',
                    onPress: () {
                      if (Provider.of<Data>(context, listen: false)
                              .selectedVoteType !=
                          -1) {
                        Navigator.pushReplacement(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (_, __, ___) => CheckVoteTypeWindow(),
                            transitionDuration: Duration(seconds: 0),
                          ),
                        );
                      }
                    },
                    size: getProportionateScreenWidth(180),
                    verticalSize: getProportionateScreenHeight(50),
                  ),
                ],
              ),
              SizedBox(
                height: getProportionateScreenHeight(30),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ChooseVoteBox extends StatelessWidget {
  const ChooseVoteBox({
    Key key,
    this.text = "",
    @required this.isChecked,
    this.isTapped,
  }) : super(key: key);
  final String text;
  final bool isChecked;
  final Function isTapped;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: getProportionateScreenHeight(40),
      ),
      child: GestureDetector(
        onTap: () => isTapped(),
        child: Container(
          height: getProportionateScreenHeight(120),
          width: getProportionateScreenWidth(260),
          decoration: BoxDecoration(
            color: isChecked ? kDefaultColor : Colors.transparent,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              color: kDefaultColor,
              width: getProportionateScreenWidth(1),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(
              right: getProportionateScreenWidth(20),
            ),
            child: Center(
              child: Row(
                children: [
                  Expanded(
                    child: Icon(
                      Icons.check,
                      size: getProportionateScreenWidth(25),
                      color: isChecked ? Colors.white : Colors.transparent,
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Text(
                      text,
                      style: TextStyle(
                        color: isChecked ? Colors.white : kDefaultColor,
                        fontSize: getProportionateScreenWidth(14),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
