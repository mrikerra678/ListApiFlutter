class User {
  int id;
  String name;
  String email;
  String image;

  User(int id, String name, String email, String image) {
    this.id = id;
    this.name = name;
    this.email = email;
    this.image = image;
  }

  User.fromJson(Map<String, dynamic> json)
      : name = json["name"]["first"],
        email = json["name"]["last"],
        image = json["picture"]["medium"];

  Map<String, dynamic> toJson() {
    return {'name': name, 'email': email, 'image': image};
  }
}
