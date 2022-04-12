import 'package:flutter/material.dart';
import 'package:sios_app/theme/app_theme.dart';
class DetailService extends StatelessWidget {
  const DetailService({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Apptheme.primarylight,
      ),
    );
  }
}