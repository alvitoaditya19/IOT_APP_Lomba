part of 'page_bloc.dart';

abstract class PageState extends Equatable {
  const PageState();
}

class OnInitialPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnLoginPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnSignUpPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnSplashPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnLanding extends PageState {
  @override
  List<Object> get props => [];
}

class OnStartMenu extends PageState {
  @override
  List<Object> get props => [];
}

class OnMainPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnRegistrationPage extends PageState {
  final RegistrationData registrationData;

  OnRegistrationPage(this.registrationData);

  @override
  List<Object> get props => [];
}

class OnPreferencePage extends PageState {
  final RegistrationData registrationData;

  OnPreferencePage(this.registrationData);

  @override
  List<Object> get props => [];
}

class OnAccountConfirmationPage extends PageState {
  final RegistrationData registrationData;

  OnAccountConfirmationPage(this.registrationData);

  @override
  List<Object> get props => [];
}

class OnSaintekPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnProfileScreen extends PageState {
  @override
  List<Object> get props => [];
}

class OnEditProfilePage extends PageState {
  final User user;

  OnEditProfilePage(this.user);

  @override
  List<Object> get props => [user];
}
