import 'package:flutter/material.dart';

import 'components/body.dart';

class VoteSuccessWindow extends StatelessWidget {
  static String routeName = '/success';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
