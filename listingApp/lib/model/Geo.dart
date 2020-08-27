class Geo {
  double latitude;
  double longitude;

  Geo({this.latitude, this.longitude});

  factory Geo.fromJson(Map<String, dynamic> parsedJson) {
    return Geo(
      longitude: double.parse(parsedJson['lat']),
      latitude: double.parse(parsedJson['lng']),
    );
  }
}
