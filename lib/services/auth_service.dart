import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:sios_app/models/models.dart';


class AuthService extends ChangeNotifier{

  late User user;
  final storage = FlutterSecureStorage();

  //* Funcion que hace la peticion de Login

  Future<bool> login( String ncontrol, String password ) async {

    final authData = {
      'username': ncontrol,
      'password': password
    };

    final resp = await http.post( Uri.parse('https://sios-server.herokuapp.com/api/auth/login'),
    // final resp = await http.post( Uri.parse('http://10.1.25.14:3000/api/auth/login'),
      body: jsonEncode(authData),
      headers: {
        'Content-Type': 'application/json'
      }
    );

    final Map<String,dynamic> decodedResp = json.decode(resp.body);

    if(decodedResp.containsKey('accessToken')){
      // print(decodedResp['accessToken']);
      await storage.write(key: 'token', value: decodedResp['accessToken']);

      user = User.convertirJson(decodedResp['user']);
      // print(user.name);
      return true;
    }else{
      return false;
    }

  }

  //* Funcion que cierra sesion 

  Future logout () async {

    await storage.delete(key: 'token');
    return;
    
  }

  //* Verifica si el token es valido

  Future<bool> verifyToken () async{

    final token = await storage.read(key: 'token') ?? 'olakease';
    
    final resp = await http.get(Uri.parse('https://sios-server.herokuapp.com/api/auth/renew'),headers: {
    // final resp = await http.get(Uri.parse('http://10.1.25.14:3000/api/auth/renew'),headers: {
      'authorization': 'Bearer $token'
    });

    final Map<String,dynamic> decodedResp = json.decode(resp.body);

    if(decodedResp['status'] == true){
      user = User.convertirJson(decodedResp['user']);
      // print(user.name);
    }
    
    return decodedResp['status'];

  }

  //* Metodo para enviar token

  static Future<String> getToken() async {
    
    final _storage = new FlutterSecureStorage();
    final token = await _storage.read(key: 'token');
    return token!;

  }

}