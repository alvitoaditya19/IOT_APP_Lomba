part of 'models.dart';

class RegistrationData {
  String name;
  String email;
  String password;
  File profileImage;
  String selectedSchool;

  RegistrationData(
      {this.name = "",
      this.email = "",
      this.password = "",
      this.profileImage,
      this.selectedSchool = ""});
}
