class User {
  final int id;
  final String username;
  final String email;
  final String firstName;
  final String lastName;

  User(
      {required this.id, required this.username, required this.email, this.firstName = '', this.lastName = ''});

  //convert to json

  factory User.fromJson(Map<String, dynamic> json){
    return User(
        id: json['id'],
        username: json['username'],
        email: json['email'],
        firstName: json['first_name'],
        lastName: json['last_name']
    );
  }
  //full name
  String get fullName{
    final name = '$firstName $lastName'.trim();
    return name.isNotEmpty ? name : username;
  }


}