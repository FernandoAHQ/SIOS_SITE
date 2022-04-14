import 'package:flutter/material.dart';
import 'package:sios_app/screens/detail_service.dart';

import 'package:sios_app/screens/screens.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  'loading'  : (context) => const LoadingScreen(),
  'login'  : (_) => const LoginScreen(),
  'home'  : (context) => const HomeScreen(),
  'details'  : (context) =>  DetailService(),
};