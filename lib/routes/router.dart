import 'package:flutter/material.dart';
import 'package:sios_app/screens/screens.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  'loading'   : (context) => const LoadingScreen(),
  'login'     : (context) => const LoginScreen(),
  'home'      : (context) => const HomeScreen(),
  'details'   : (context) => const DetailService(),
  'feedback'  : (context) => const FeedbackScreen(),
};