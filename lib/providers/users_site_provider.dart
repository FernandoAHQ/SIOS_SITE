import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sios_app/models/models.dart';

class UsersSiteProvider extends ChangeNotifier{

  List<SiteUsersResponse> results = [];

  getSiteUsers() async {

    final resp = await http.get(Uri.parse('https://sios-server.herokuapp.com/api/users/all/active'));
    if (resp.statusCode == 200) {
      
      final jsonData = json.decode(resp.body);

      

    }
    
  }
  
}