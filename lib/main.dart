import 'package:flutter/widgets.dart';
import 'package:temperature_fetch_app/app.dart';
import 'package:temperature_fetch_app/repositries/authentication_repository.dart';
import 'package:temperature_fetch_app/repositries/user_repository.dart';

void main() {
  runApp(App(
    authenticationRepository: AuthenticationRepository(),
    userRepository: UserRepository(),
  ));
}