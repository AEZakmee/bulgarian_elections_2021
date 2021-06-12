import 'package:flutter/material.dart';
import 'package:mashinno_glasuvane/model/political_party.dart';

class Data extends ChangeNotifier {
  List<PoliticalParty> _parties = [];
  void loadParties(List<PoliticalParty> data) {
    _parties = data;
    _loadNewList();
    notifyListeners();
  }

  int _numberPeople;
  int get numberPeople => _numberPeople;
  void setPeopleNumber(int number) {
    _numberPeople = number;
    print('people loaded, total of $_numberPeople');
    notifyListeners();
  }

  List<PoliticalParty> _partiesSubList = [];
  List<PoliticalParty> get partiesSubList => _partiesSubList;
  int _currentPage = 0;
  void nextPage() {
    if (_currentPage < _parties.length ~/ 13) {
      _currentPage++;
      _loadNewList();
      notifyListeners();
    }
  }

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
        _currentPage * 13,
        _currentPage * 13 + 13 > _parties.length
            ? _parties.length
            : _currentPage * 13 + 13);
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
