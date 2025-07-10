import 'package:flutter/material.dart';
import 'package:takki/screens/auth/register/registerScreen.dart';
import 'package:takki/screens/chats/chats.screen.dart';
import 'package:takki/screens/chats/newChat.screen.dart';
import 'package:takki/screens/landing/landingScreen.dart';
import 'package:takki/screens/profile/profileScreens.dart';
import 'package:takki/screens/qr/scanQR.screen.dart';
import 'package:takki/screens/qr/viewQR.screen.dart';

import '../screens/auth/login/login.screen.dart';
import '../screens/chats/chat.screen.dart';

final Map<String, WidgetBuilder> routes = {
  LandingScreen.routeName: (context) => const LandingScreen(),
  LoginScreen.routeName: (context) => const LoginScreen(),
  ChatsScreen.routeName: (context) => const ChatsScreen(),
  RegisterScreen.routeName: (context) => const RegisterScreen(),
  NewChatScreen.routeName: (context) => const NewChatScreen(),
  ProfileScreen.routeName: (context) => const ProfileScreen(),
  ScanQR.routeName: (context) => const ScanQR(),
  ViewQR.routeName: (context) => const ViewQR(),
  
  ChatScreen.routeName: (context) => const ChatScreen(),
  };
