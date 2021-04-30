class PoliticalParty {
  int number;
  String name;
  List<Person> people;

  PoliticalParty({this.number, this.name, this.people});

  factory PoliticalParty.fromJson(Map<String, dynamic> json) {
    return PoliticalParty(
      number: json['number'],
      name: json['name'],
      people: List.from(json['people'].map((e) => Person.fromJson(e)).toList()),
    );
  }
}

class Person {
  int number;
  String name;
  Person({this.number, this.name});
  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
      number: json['number'],
      name: json['name'],
    );
  }
}

// List<PoliticalParty> loadParties() {
//   List<String> demoPeople = [for (int i = 0; i < 27; i++) 'Човек $i'];
//   List<PoliticalParty> parties = [
//     PoliticalParty(name: 'БСП', number: 4, people: demoPeople),
//     PoliticalParty(name: 'ГЕРБ', number: 28, people: demoPeople),
//     PoliticalParty(name: 'СДС', number: 41, people: demoPeople),
//     PoliticalParty(name: 'ВМРО', number: 1, people: demoPeople),
//     PoliticalParty(name: 'Да България', number: 15, people: demoPeople),
//   ];
//   parties.sort((a, b) => a.number.compareTo(b.number));
//   return parties;
// }
