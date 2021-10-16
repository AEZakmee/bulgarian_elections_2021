import 'package:flutter/material.dart';
import 'package:mashinno_glasuvane/screens/check_selected_type/check_selected_type_screen.dart';
import 'package:mashinno_glasuvane/screens/checkresult_screen/checkresult_screen.dart';
import 'package:mashinno_glasuvane/screens/home_screen/home_screen.dart';
import 'package:mashinno_glasuvane/screens/president_vote/president_vote_screen.dart';
import 'package:mashinno_glasuvane/screens/vote_screen/vote_screen.dart';
import 'package:mashinno_glasuvane/screens/vote_success/vote_success.dart';
import 'package:mashinno_glasuvane/screens/vote_type_screen/vote_type_screen.dart';

final Map<String, WidgetBuilder> routes = {
  HomeWindow.routeName: (context) => HomeWindow(),
  VoteScreen.routeName: (context) => VoteScreen(),
  CheckResultWindow.routeName: (context) => CheckResultWindow(),
  VoteSuccessWindow.routeName: (context) => VoteSuccessWindow(),
  VoteTypeScreen.routeName: (context) => VoteTypeScreen(),
  PresidentScreen.routeName: (context) => PresidentScreen(),
  CheckVoteTypeWindow.routeName: (context) => CheckVoteTypeWindow()
};
