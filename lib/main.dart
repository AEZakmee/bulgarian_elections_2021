import 'package:flutter/material.dart';
import 'package:mashinno_glasuvane/constants.dart';
import 'package:mashinno_glasuvane/routes.dart';
import 'package:mashinno_glasuvane/screens/home_screen/home_screen.dart';
import 'package:provider/provider.dart';
import 'model/data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Data()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Машинно гласуване - реплика',
        theme: ThemeData(
          textTheme: TextTheme(
            bodyText1: TextStyle(
              color: kDefaultColor,
              fontWeight: FontWeight.w700,
            ),
            bodyText2: TextStyle(color: kDefaultColor),
          ),
        ),
        initialRoute: HomeWindow.routeName,
        routes: routes,
      ),
    );
  }
}
