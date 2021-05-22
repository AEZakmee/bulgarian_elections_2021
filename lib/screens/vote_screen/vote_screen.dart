import 'package:flutter/material.dart';
import 'components/body.dart';

class VoteScreen extends StatelessWidget {
  static String routeName = '/vote_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
