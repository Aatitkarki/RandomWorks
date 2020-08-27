import 'package:listingApp/model/Address.dart';
import 'package:listingApp/model/Company.dart';

class User {
  int id;
  String name;
  String username;
  String email;
  Address address;
  String phone;
  String website;
  Company company;

  User(
      {this.id,
      this.name,
      this.email,
      this.address,
      this.phone,
      this.company,
      this.username,
      this.website});

  factory User.fromJson(Map<String, dynamic> parsedJson) {
    return User(
        id: parsedJson["id"],
        name: parsedJson["name"],
        username: parsedJson["email"],
        email: parsedJson["email"],
        address: Address.fromJson(parsedJson["address"]),
        phone: parsedJson["phone"],
        website: parsedJson["website"],
        company: Company.fromJson(parsedJson["company"]));
  }
}
