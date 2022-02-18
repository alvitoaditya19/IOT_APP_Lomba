part of 'models.dart';

class User extends Equatable {
  final String id;
  final String email;
  final String name;
  final String profilePicture;
  final String selectedSchool;
  final int balance;

  User(this.id, this.email,
      {this.name, this.profilePicture, this.balance, this.selectedSchool});

  @override
  String toString() {
    return "[$id] - $name, $email";
  }

  User copyWith({String name, String profilePicture, int balance}) =>
      User(this.id, this.email,
          name: name ?? this.name,
          profilePicture: profilePicture ?? this.profilePicture,
          balance: balance ?? this.balance,
          selectedSchool: selectedSchool);

  @override
  List<Object> get props =>
      [id, email, name, profilePicture, selectedSchool, balance];
}
