import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

import 'package:sios_app/services/auth_service.dart';

enum ServerStatus {
  Online,
  Offline,
  Connecting
}

class SocketProvider extends ChangeNotifier{

  ServerStatus _serverStatus = ServerStatus.Connecting;

  late IO.Socket _socket;

  late dynamic services = [];

  ServerStatus get serverStatus => _serverStatus;
  IO.Socket    get socket       => _socket;
  
  Function get emit => _socket.emit;
  
  void connect() async {

    final token = await AuthService.getToken();

    // _socket = IO.io('https://sios-server.herokuapp.com/',
    _socket = IO.io('http://10.1.25.46:4000/',

      IO.OptionBuilder()
        .setTransports(['websocket'])
        .enableForceNew()
        .setQuery({
          'accessToken': 'Bearer $token'
        })
        .build()
    
    );

    _socket.on('connect', (_) {
      
      _serverStatus = ServerStatus.Online;
      notifyListeners();

    });

    _socket.on('disconnect', (_) {
      
      _serverStatus = ServerStatus.Offline;
      notifyListeners();
      
    });

    _socket.on('services-list', (servicios){
      
      services = servicios;
      notifyListeners();

    }
    );
    
  }

  void disconnect(){

    _socket.disconnect();

  }

}