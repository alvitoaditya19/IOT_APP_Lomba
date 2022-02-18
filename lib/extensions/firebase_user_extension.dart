part of 'extensions.dart';

extension FirebaseUserExtension on auth.User {
  User convertToUser({
    String name = "No Name",
    List<String> selectedGenres = const [],
    String selectedSchool = "",
    int balance = 20,
  }) =>
      User(
        this.uid,
        this.email,
        name: name,
        balance: balance,
        selectedSchool: selectedSchool,
      );

  Future<User> fromFireStore() async => await UserServices.getUser(this.uid);
}
