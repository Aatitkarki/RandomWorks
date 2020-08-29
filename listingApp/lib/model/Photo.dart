// To parse this JSON data, do
//
//     final photo = photoFromJson(jsonString);

import 'dart:convert';

Photo photoFromJson(String str) => Photo.fromJson(json.decode(str));

String photoToJson(Photo data) => json.encode(data.toJson());

class Photo {
    Photo({
        this.albums,
        this.id,
        this.title,
        this.url,
        this.thumbnailUrl,
    });

    int albums;
    int id;
    String title;
    String url;
    String thumbnailUrl;

    factory Photo.fromJson(Map<String, dynamic> json) => Photo(
        albums: json["Albums"],
        id: json["Id"],
        title: json["Title"],
        url: json["Url"],
        thumbnailUrl: json["ThumbnailUrl"],
    );

    Map<String, dynamic> toJson() => {
        "Albums": albums,
        "Id": id,
        "Title": title,
        "Url": url,
        "ThumbnailUrl": thumbnailUrl,
    };
}