import 'package:flutter/material.dart';
import 'package:takki/screens/chats/chats.screen.dart';
import 'package:takki/screens/landing/landingScreen.dart';

import '../screens/login/login.screen.dart';

final Map<String, WidgetBuilder> routes = {
  LandingScreen.routeName: (context) => const LandingScreen(),
  LoginScreen.routeName: (context) => const LoginScreen(),
  ChatsScreen.routeName: (context) => const ChatsScreen(),
  // '/ruta': (context) => PaginaWidget(),
};
