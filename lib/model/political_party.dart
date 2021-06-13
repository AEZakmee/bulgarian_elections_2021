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
