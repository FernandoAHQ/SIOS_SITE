import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sios_app/models/models.dart';
import 'package:sios_app/services/services.dart';


class ServiceQuery extends ChangeNotifier{

  Service? service;

  Future getService (String? idService)async{

    final token = await AuthService.getToken();

    // print(token);

    final resp = await http.get(Uri.parse('https://sios-server.herokuapp.com/api/services/$idService'),headers: {
    // final resp = await http.get(Uri.parse('http://10.1.25.40:4000/api/services/$idService'),headers: {
      'authorization': 'Bearer $token'
    });

    if(resp.statusCode == 200){
      
      final jsonData = json.decode(resp.body);

      return service = Service.extraerInfo(jsonData);
      
    }

  }
  
}