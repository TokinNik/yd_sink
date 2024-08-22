class UserDataModel {
  final int id;
  final String username;
  final String email;
  final String firstName;
  final String lastName;
  final String gender;
  final String image;

//<editor-fold desc="Data Methods">
  const UserDataModel({
    required this.id,
    required this.username,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.image,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserDataModel &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          username == other.username &&
          email == other.email &&
          firstName == other.firstName &&
          lastName == other.lastName &&
          gender == other.gender &&
          image == other.image);

  @override
  int get hashCode =>
      id.hashCode ^
      username.hashCode ^
      email.hashCode ^
      firstName.hashCode ^
      lastName.hashCode ^
      gender.hashCode ^
      image.hashCode;

  @override
  String toString() {
    return 'UserDataModel{' +
        ' id: $id,' +
        ' username: $username,' +
        ' email: $email,' +
        ' firstName: $firstName,' +
        ' lastName: $lastName,' +
        ' gender: $gender,' +
        ' image: $image,' +
        '}';
  }

  UserDataModel copyWith({
    int? id,
    String? username,
    String? email,
    String? firstName,
    String? lastName,
    String? gender,
    String? image,
  }) {
    return UserDataModel(
      id: id ?? this.id,
      username: username ?? this.username,
      email: email ?? this.email,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      gender: gender ?? this.gender,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'username': this.username,
      'email': this.email,
      'firstName': this.firstName,
      'lastName': this.lastName,
      'gender': this.gender,
      'image': this.image,
    };
  }

  factory UserDataModel.fromMap(Map<String, dynamic> map) {
    return UserDataModel(
      id: map['id'] as int,
      username: map['username'] as String,
      email: map['email'] as String,
      firstName: map['firstName'] as String,
      lastName: map['lastName'] as String,
      gender: map['gender'] as String,
      image: map['image'] as String,
    );
  }

//</editor-fold>
}
