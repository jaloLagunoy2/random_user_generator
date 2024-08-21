class User {
  String gender;
  Name name;
  Location location;
  String email;
  Login login;
  DateOfBirth dob;
  Registration registered;
  String? phone;  // Optional, can be null
  String? cell;   // Optional, can be null
  Picture? picture;  // Optional, can be null
  String nationality;

  User({
    required this.gender,
    required this.name,
    required this.location,
    required this.email,
    required this.login,
    required this.dob,
    required this.registered,
    this.phone,
    this.cell,
    this.picture,
    required this.nationality,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      gender: json['gender'] ?? 'Unknown',
      name: Name.fromJson(json['name']),
      location: Location.fromJson(json['location']),
      email: json['email'] ?? 'No email provided',
      login: Login.fromJson(json['login']),
      dob: DateOfBirth.fromJson(json['dob']),
      registered: Registration.fromJson(json['registered']),
      phone: json['phone'] ?? 'No phone available',  // Default if missing
      cell: json['cell'] ?? 'No cell available',      // Default if missing
      picture: json['picture'] != null ? Picture.fromJson(json['picture']) : null,  // Can be null if missing
      nationality: json['nat'] ?? 'Unknown',
    );
  }
}

class Name {
  String title;
  String first;
  String last;

  Name({required this.title, required this.first, required this.last});

  factory Name.fromJson(Map<String, dynamic> json) {
    return Name(
      title: json['title'] ?? 'Unknown',
      first: json['first'] ?? 'Unknown',
      last: json['last'] ?? 'Unknown',
    );
  }
}

class Location {
  Street street;
  String city;
  String state;
  String country;
  String postcode;
  Coordinates coordinates;
  Timezone? timezone;  // Optional, can be null

  Location({
    required this.street,
    required this.city,
    required this.state,
    required this.country,
    required this.postcode,
    required this.coordinates,
    this.timezone,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      street: Street.fromJson(json['street']),
      city: json['city'] ?? 'Unknown',
      state: json['state'] ?? 'Unknown',
      country: json['country'] ?? 'Unknown',
      postcode: json['postcode']?.toString() ?? 'Unknown',
      coordinates: Coordinates.fromJson(json['coordinates']),
      timezone: json['timezone'] != null ? Timezone.fromJson(json['timezone']) : null,  // Can be null
    );
  }
}

class Street {
  int number;
  String name;

  Street({required this.number, required this.name});

  factory Street.fromJson(Map<String, dynamic> json) {
    return Street(
      number: json['number'] ?? 0,  // Default value if missing
      name: json['name'] ?? 'Unknown',
    );
  }
}

class Coordinates {
  String latitude;
  String longitude;

  Coordinates({required this.latitude, required this.longitude});

  factory Coordinates.fromJson(Map<String, dynamic> json) {
    return Coordinates(
      latitude: json['latitude'] ?? '0.0',  // Default if missing
      longitude: json['longitude'] ?? '0.0',  // Default if missing
    );
  }
}

class Timezone {
  String offset;
  String description;

  Timezone({required this.offset, required this.description});

  factory Timezone.fromJson(Map<String, dynamic> json) {
    return Timezone(
      offset: json['offset'] ?? 'Unknown',
      description: json['description'] ?? 'Unknown',
    );
  }
}

class Login {
  String uuid;
  String username;
  String password;
  String salt;
  String md5;
  String sha1;
  String sha256;

  Login({
    required this.uuid,
    required this.username,
    required this.password,
    required this.salt,
    required this.md5,
    required this.sha1,
    required this.sha256,
  });

  factory Login.fromJson(Map<String, dynamic> json) {
    return Login(
      uuid: json['uuid'] ?? 'Unknown',
      username: json['username'] ?? 'Unknown',
      password: json['password'] ?? '',
      salt: json['salt'] ?? '',
      md5: json['md5'] ?? '',
      sha1: json['sha1'] ?? '',
      sha256: json['sha256'] ?? '',
    );
  }
}

class DateOfBirth {
  String date;
  int age;

  DateOfBirth({required this.date, required this.age});

  factory DateOfBirth.fromJson(Map<String, dynamic> json) {
    return DateOfBirth(
      date: json['date'] ?? 'Unknown',
      age: json['age'] ?? 0,
    );
  }
}

class Registration {
  String date;
  int age;

  Registration({required this.date, required this.age});

  factory Registration.fromJson(Map<String, dynamic> json) {
    return Registration(
      date: json['date'] ?? 'Unknown',
      age: json['age'] ?? 0,
    );
  }
}

class Picture {
  String large;
  String medium;
  String thumbnail;

  Picture({required this.large, required this.medium, required this.thumbnail});

  factory Picture.fromJson(Map<String, dynamic> json) {
    return Picture(
      large: json['large'] ?? '',
      medium: json['medium'] ?? '',
      thumbnail: json['thumbnail'] ?? '',
    );
  }
}
