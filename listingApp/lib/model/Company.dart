class Company {
  String name;
  String catchPhrase;
  String bs;

  Company({this.name, this.catchPhrase, this.bs});
  factory Company.fromJson(Map<String, dynamic> parsedJson) {
    return Company(
        name: parsedJson["name"],
        catchPhrase: parsedJson["catchPhrase"],
        bs: parsedJson["bs"]);
  }
}
