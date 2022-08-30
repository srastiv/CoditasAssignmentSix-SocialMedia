import 'dart:convert';

class UserNetworkHelper {
  UserNetworkHelper({
    required this.gender,
    required this.name,
    required this.email,
    required this.login,
    required this.phone,
    required this.cell,
    required this.picture,
    required this.nat,
    required this.isBookmarkAdded,
  });

  final String gender;
  final Name name;
  final String email;
  final Login login;
  final String phone;
  final String cell;
  final Picture picture;
  final String nat;
  bool isBookmarkAdded = false;

  factory UserNetworkHelper.fromRawJson(String str) =>
      UserNetworkHelper.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserNetworkHelper.fromJson(Map<String, dynamic> json) =>
      UserNetworkHelper(
        gender: json["gender"],
        name: Name.fromJson(json["name"]),
        email: json["email"],
        login: Login.fromJson(json["login"]),
        phone: json["phone"],
        cell: json["cell"],
        picture: Picture.fromJson(json["picture"]),
        nat: json["nat"],
        isBookmarkAdded: false,
      );

  Map<String, dynamic> toJson() => {
        "gender": gender,
        "name": name.toJson(),
        "email": email,
        "login": login.toJson(),
        "phone": phone,
        "cell": cell,
        "picture": picture.toJson(),
        "nat": nat,
      };
}

class Login {
  Login({
    required this.uuid,
    required this.username,
    required this.password,
    required this.salt,
    required this.md5,
    required this.sha1,
    required this.sha256,
  });

  final String uuid;
  final String username;
  final String password;
  final String salt;
  final String md5;
  final String sha1;
  final String sha256;

  factory Login.fromRawJson(String str) => Login.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Login.fromJson(Map<String, dynamic> json) => Login(
        uuid: json["uuid"],
        username: json["username"],
        password: json["password"],
        salt: json["salt"],
        md5: json["md5"],
        sha1: json["sha1"],
        sha256: json["sha256"],
      );

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "username": username,
        "password": password,
        "salt": salt,
        "md5": md5,
        "sha1": sha1,
        "sha256": sha256,
      };
}

class Name {
  Name({
    required this.title,
    required this.first,
    required this.last,
  });

  final String title;
  final String first;
  final String last;

  factory Name.fromRawJson(String str) => Name.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Name.fromJson(Map<String, dynamic> json) => Name(
        title: json["title"],
        first: json["first"],
        last: json["last"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "first": first,
        "last": last,
      };
}

class Picture {
  Picture({
    required this.large,
    required this.medium,
    required this.thumbnail,
  });

  final String large;
  final String medium;
  final String thumbnail;

  factory Picture.fromRawJson(String str) => Picture.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Picture.fromJson(Map<String, dynamic> json) => Picture(
        large: json["large"],
        medium: json["medium"],
        thumbnail: json["thumbnail"],
      );

  Map<String, dynamic> toJson() => {
        "large": large,
        "medium": medium,
        "thumbnail": thumbnail,
      };
}
