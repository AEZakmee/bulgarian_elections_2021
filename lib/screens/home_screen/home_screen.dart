import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mashinno_glasuvane/model/data.dart';
import 'package:mashinno_glasuvane/model/political_party.dart';
import 'package:provider/provider.dart';

import '../../size_config.dart';
import 'components/body.dart';

class HomeWindow extends StatefulWidget {
  static String routeName = '/';

  @override
  _HomeWindowState createState() => _HomeWindowState();
}

class _HomeWindowState extends State<HomeWindow> {
  void _loadData() async {
    final String response = await rootBundle.loadString('assets/data_pz.json');
    final data = await json.decode(response);
    List<PoliticalParty> parties = [];
    data['parties'].forEach((v) {
      parties.add(PoliticalParty.fromJson(v));
    });
    Provider.of<Data>(context, listen: false)
        .setPeopleNumber(data['peopleNumber']);
    Provider.of<Data>(context, listen: false).loadParties(parties);
    // parties.forEach((element) {
    //   print(element.name);
    //   print(element.people.map((el) => el.name).join(' '));
    //   print('\n');
    // });
  }

  @override
  void initState() {
    _loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
    );
  }
}
