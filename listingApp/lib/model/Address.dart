import 'package:listingApp/model/Geo.dart';

class Address {
  String street;
  String suite;
  String city;
  int zipcode;
  Geo geo;

  Address({this.street, this.suite, this.city, this.zipcode, this.geo});
  factory Address.fromJson(Map<String, dynamic> parsedJson) {
    return Address(
        street: parsedJson["street"],
        suite: parsedJson["suite"],
        city: parsedJson["city"],
        zipcode: int.parse(parsedJson["zipcode"]),
        geo: Geo.fromJson(parsedJson["geo"]));
  }
}
