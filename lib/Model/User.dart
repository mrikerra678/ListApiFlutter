class User {
  int valor;
  String name;
  String email;
  String image;

  User(int valor, String name, String email, String image) {
    this.valor = 1;
    this.name = name;
    this.email = email;
    this.image = image;
  }

  User.fromJson(Map<String, dynamic> json)
      : name = json["name"]["first"],
        email = json["name"]["last"],
        image = json["picture"]["medium"],
        valor = 1;

  Map<String, dynamic> toJson() {
    return {'name': name, 'email': email, 'image': image};
  }
}
