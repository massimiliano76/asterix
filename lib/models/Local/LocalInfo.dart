import 'package:asterix/models/Local/TimeTables.dart';

class LocalInfo {
  final String name;
  final String email;
  final String address;
  final String zipCode;
  final String city;
  final String nation;
  final String slug;
  final String phoneNumber;
  final String facebookLink;
  final String instagramLink;
  final String mapLocation;
  final TimeTables times;

  LocalInfo(
    this.name,
    this.email,
    this.address,
    this.zipCode,
    this.city,
    this.nation,
    this.slug,
    this.phoneNumber,
    this.facebookLink,
    this.instagramLink,
    this.mapLocation,
    this.times,
  );

  LocalInfo.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        email = json['email'],
        address = json['address'],
        zipCode = json['zipcode'],
        city = json['city'],
        nation = json['nation'],
        slug = json['slug'],
        phoneNumber = json['phone'],
        facebookLink = json['facebook'],
        instagramLink = json['instagram'],
        mapLocation = json['maps'],
        times = TimeTables.fromJson(json['timetables']);

  @override
  String toString() {
    return "$name, $email, $address, $zipCode, $city, $nation, $slug, $phoneNumber, $facebookLink, $instagramLink, $mapLocation";
  }
}
