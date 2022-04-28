import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:sios_app/providers/providers.dart';
import 'package:sios_app/routes/router.dart';
import 'package:sios_app/services/auth_service.dart';
import 'package:sios_app/services/service_query.dart';
import 'package:sios_app/theme/app_theme.dart';

void main() => runApp( MyApp());

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>AuthService()),
        ChangeNotifierProvider(create: (_)=>SocketProvider()),
        ChangeNotifierProvider(create: (_)=>ServiceQuery()),
        ChangeNotifierProvider(create: (_)=>FeedBackProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: Apptheme.lightTheme,
        title: 'App',
        initialRoute: 'loading',
        routes: appRoutes,
      ),
    );
  }
}