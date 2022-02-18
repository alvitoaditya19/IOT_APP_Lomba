part of 'page_bloc.dart';

abstract class PageEvent extends Equatable {
  const PageEvent();
}

class GoToSplashPage extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToLanding extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToStartMenu extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToLoginPage extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToSignUpPage extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToMainPage extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToRegistrationPage extends PageEvent {
  final RegistrationData registrationData;

  GoToRegistrationPage(this.registrationData);

  @override
  List<Object> get props => [];
}

class GoToPreferencePage extends PageEvent {
  final RegistrationData registrationData;

  GoToPreferencePage(this.registrationData);

  @override
  List<Object> get props => [];
}

class GoToAccountConfirmationPage extends PageEvent {
  final RegistrationData registrationData;

  GoToAccountConfirmationPage(this.registrationData);

  @override
  List<Object> get props => [];
}

class GoToSaintekPage extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToProfileScreen extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToEditProfilePage extends PageEvent {
  final User user;

  GoToEditProfilePage(this.user);

  @override
  List<Object> get props => [user];
}
