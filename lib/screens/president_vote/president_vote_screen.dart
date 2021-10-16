import 'package:flutter/material.dart';

import 'components/body.dart';

class PresidentScreen extends StatelessWidget {
  static String routeName = '/president_vote_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
