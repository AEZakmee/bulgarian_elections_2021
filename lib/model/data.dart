import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mashinno_glasuvane/model/political_party.dart';

import '../constants.dart';

class Data extends ChangeNotifier {
  List<PoliticalParty> _parties = [];

  void init() async {
    final String response = await rootBundle.loadString(
      'assets/demo_data.json',
    );
    final data = await json.decode(response);
    List<PoliticalParty> parties = [];

    data['parties'].forEach((v) {
      parties.add(PoliticalParty.fromJson(v));
    });

    setPeopleNumber(data['peopleNumber']);
    loadParties(parties);
  }

  void loadParties(List<PoliticalParty> data) {
    _parties = data;
    _loadNewList();
    notifyListeners();
  }

  int _numberPeople = 0;
  int get numberPeople => _numberPeople;
  void setPeopleNumber(int number) {
    _numberPeople = number;
    notifyListeners();
  }

  List<PoliticalParty> _partiesSubList = [];
  List<PoliticalParty> get partiesSubList => _partiesSubList;
  int _currentPage = 0;
  void nextPage() {
    if (_currentPage < _parties.length ~/ kPartiesInPage) {
      _currentPage++;
      _loadNewList();
      notifyListeners();
    }
  }

  bool showPrevButton() => _currentPage > 0;
  bool showNextButton() => _currentPage < 1;

  void prevPage() {
    if (_currentPage > 0) {
      _currentPage--;
      _loadNewList();
      notifyListeners();
    }
  }

  void firstPage() {
    _currentPage = 0;
    _loadNewList();
    notifyListeners();
  }

  void _loadNewList() {
    _partiesSubList = _parties.sublist(
        _currentPage * kPartiesInPage,
        _currentPage * kPartiesInPage + kPartiesInPage > _parties.length
            ? _parties.length
            : _currentPage * kPartiesInPage + kPartiesInPage);
  }

  PoliticalParty selectedParty;
  void selectParty(int index) {
    selectedParty = _partiesSubList[index];
    selectedPerson = null;
    notifyListeners();
  }

  Person selectedPerson;
  void selectPerson(int index) {
    if (selectedParty != null) {
      selectedPerson = selectedParty.people[index];
      notifyListeners();
    }
  }

  void clearVote() {
    selectedPerson = null;
    selectedParty = null;
    notifyListeners();
  }
}
