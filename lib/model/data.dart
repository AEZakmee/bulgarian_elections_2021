import 'package:flutter/material.dart';
import 'package:mashinno_glasuvane/model/political_party.dart';
import 'package:mashinno_glasuvane/model/president.dart';

class Data extends ChangeNotifier {
  List<PoliticalParty> _parties = [];
  void loadParties(List<PoliticalParty> data) {
    _parties = data;
    _loadNewList();
    notifyListeners();
  }

  int _numberPeople = 0;
  int get numberPeople => _numberPeople;
  void setPeopleNumber(int number) {
    _numberPeople = number;
    //print('people loaded, total of $_numberPeople');
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

  void _firstPage() {
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

  List<String> buttonTypes = [
    "ИЗБОРИ ЗА ПРЕЗИДЕНТ И ВИЗЕПРЕЗИДЕНТ И ЗА НАРОДНИ ПРЕДСТАВИТЕЛИ",
    "ИЗБОРИ ЗА ПРЕЗИДЕНТ И ВИЗЕПРЕЗИДЕНТ",
    "ИЗБОРИ ЗА НАРОДНИ ПРЕДСТАВИТЕЛИ",
  ];
  get selectedButtonText => buttonTypes[_selectedVoteType] ?? '';
  int _selectedVoteType = -1;
  get selectedVoteType => _selectedVoteType;
  set selectedVoteType(data) {
    if (_selectedVoteType == data) {
      _selectedVoteType = -1;
    } else {
      _selectedVoteType = data;
    }
    notifyListeners();
  }

  List<President> _presidents = [];
  void loadPresidents(List<President> data) {
    _presidents = data;
    _loadNewListPresident();
    notifyListeners();
  }

  List<President> _presidentsSubList = [];
  List<President> get presidentsSubList => _presidentsSubList;
  int _currentPagePresident = 0;
  void nextPagePresident() {
    if (_currentPagePresident < _presidents.length ~/ 13) {
      _currentPagePresident++;
      _loadNewListPresident();
      notifyListeners();
    }
  }

  void prevPagePresident() {
    if (_currentPagePresident > 0) {
      _currentPagePresident--;
      _loadNewListPresident();
      notifyListeners();
    }
  }

  void _firstPagePresident() {
    _currentPagePresident = 0;
    _loadNewListPresident();
    notifyListeners();
  }

  void _loadNewListPresident() {
    _presidentsSubList = _presidents.sublist(
        _currentPagePresident * 13,
        _currentPagePresident * 13 + 13 > _presidents.length
            ? _presidents.length
            : _currentPagePresident * 13 + 13);
  }

  President selectedPresident;
  void selectPresident(int index) {
    selectedPresident = _presidentsSubList[index];
    notifyListeners();
  }

  void clearVote() {
    selectedPerson = null;
    selectedParty = null;
    selectedPresident = null;
    _selectedVoteType = -1;
    _firstPage();
    _firstPagePresident();
    notifyListeners();
  }
}
