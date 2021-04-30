import 'package:flutter/material.dart';
import 'package:mashinno_glasuvane/screens/checkresult_screen/checkresult_screen.dart';
import 'package:mashinno_glasuvane/screens/home_screen/home_screen.dart';
import 'package:mashinno_glasuvane/screens/vote_screen/vote_screen.dart';
import 'package:mashinno_glasuvane/screens/vote_success/vote_success.dart';

final Map<String, WidgetBuilder> routes = {
  HomeWindow.routeName: (context) => HomeWindow(),
  VoteScreen.routeName: (context) => VoteScreen(),
  CheckResultWindow.routeName: (context) => CheckResultWindow(),
  VoteSuccessWindow.routeName: (context) => VoteSuccessWindow(),
};
