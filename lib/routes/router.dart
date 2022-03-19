import 'package:flutter/material.dart';

import 'package:sios_app/screens/screens.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  'loading'  : (context) => LoadingScreen(),
  'login'  : (_) => LoginScreen(),
  'home'  : (context) => HomeScreen(),
};