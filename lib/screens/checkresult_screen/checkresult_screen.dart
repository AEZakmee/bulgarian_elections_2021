import 'package:flutter/material.dart';

import 'components/body.dart';

class CheckResultWindow extends StatelessWidget {
  static String routeName = '/result_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
