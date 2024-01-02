// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserLocation {
  final String city, state, country;
  final String postcode;
  final UserStreet street;
  final UserCoordinates coordinates;
  final UserTimezone timezone;

  UserLocation({
    required this.city,
    required this.state,
    required this.country,
    required this.postcode,
    required this.street,
    required this.coordinates,
    required this.timezone,
  });

  factory UserLocation.fromMap(Map<String, dynamic> json) {
    final street = UserStreet.fromMap(json['street']);
    final coordinates = UserCoordinates.fromMap(json['coordinates']);
    final timezone =UserTimezone.fromMap(json['timezone']) ;
    return UserLocation(
      city: json['city'],
      state: json['state'],
      country: json['country'],
      postcode: json['postcode'].toString(),
      street: street,
      coordinates: coordinates,
      timezone: timezone,
    );
  }
}

class UserStreet {
  final String number;
  final String name;

  UserStreet({required this.number, required this.name});

  factory UserStreet.fromMap(Map<String, dynamic> json) {
    return UserStreet(
      number: json['number'].toString(),
      name: json['name'],
    );
  }
}

class UserCoordinates {
  final String latitude;
  final String longitude;

  UserCoordinates({
    required this.latitude,
    required this.longitude,
  });

  factory UserCoordinates.fromMap(Map<String, dynamic> json) {
    return UserCoordinates(
      latitude: json['latitude'],
      longitude: json['longitude'],
    );
  }
}

class UserTimezone {
  final String description;
  final String offset;

  UserTimezone({
    required this.description,
    required this.offset,
  });

  factory UserTimezone.fromMap(Map<String , dynamic>json) {
    return UserTimezone(
      description: json['description'],
      offset: json['offset'],
    );
  }
}
