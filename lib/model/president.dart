class President {
  int number;
  String name;
  String presidentName;
  String vicePresidentName;

  President(
      {this.number, this.name, this.presidentName, this.vicePresidentName});

  factory President.fromJson(Map<String, dynamic> json) {
    return President(
      number: json['number'],
      name: json['name'],
      presidentName: json['presidentName'],
      vicePresidentName: json['vicePresidentName'],
    );
  }
}
