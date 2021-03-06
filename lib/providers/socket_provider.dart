import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

import 'package:sios_app/services/auth_service.dart';

enum ServerStatus {
  online,
  offline,
  connecting
}

class SocketProvider extends ChangeNotifier{

  ServerStatus _serverStatus = ServerStatus.connecting;

  late io.Socket _socket;

  late dynamic services = [];

  ServerStatus get serverStatus => _serverStatus;
  io.Socket    get socket       => _socket;
  
  Function get emit => _socket.emit;
  
  void connect() async {

    final token = await AuthService.getToken();

    _socket = io.io('https://sios-server.herokuapp.com/',
    // _socket = io.io('http://10.1.25.40:4000/',

      io.OptionBuilder()
        .setTransports(['websocket'])
        .enableForceNew()
        .setQuery({
          'accessToken': 'Bearer $token'
        })
        .build()
    
    );

    _socket.on('connect', (_) {
      
      _serverStatus = ServerStatus.online;
      notifyListeners();

    });

    _socket.on('disconnect', (_) {
      
      _serverStatus = ServerStatus.offline;
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

  void startService ( String toUserId, String fromUserId, String serviceId) {

    // print('toUserId: '+toUserId);
    // print('fromUserId: '+fromUserId);
    // print('serviceId: '+serviceId);

    _socket.emit('start',{
      "to"  : toUserId,
      "from": fromUserId,
      "service"  : serviceId,
    });
    
  }

  // void endService (''){

  //   _socket.emit('',{

  //   });

  // }

}