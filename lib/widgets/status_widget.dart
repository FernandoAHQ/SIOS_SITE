import 'package:flutter/material.dart';

class StatusWidget extends StatelessWidget {

  final dynamic service;

  const StatusWidget({
    Key? key,
    required this.service
  }) 
  : super(key: key);

  Color setColor(){
    return Colors.black;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        border: Border.all(
          color: setStatusColor()
        )  
      ),
      padding: const EdgeInsets.all(10),
      child: Text(
        setStatus(),
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.bold,
          color: setStatusColor()
        ),
      )
    );
  }

    Color setStatusColor(){
    if (service['status'] == 'pending') {
      return const Color(0xfff8b364);
    }
    else if(service['status'] == 'assigned'){
      return const Color(0xff58c0e6); 
    }
    else if(service['status'] == 'in-progress'){
      return const Color(0xfff8b364); 
    }
    else if(service['status'] == 'finalized'){
      return const Color(0xff9bcb87); 
    }
    else{
      return const Color(0xffe36363);
    }
  }

  String setStatus(){

    if (service['status'] == 'pending') {
      return 'Pendiente';
    }
    else if(service['status'] == 'assigned'){
      return 'Asignado'; 
    }
    else if(service['status'] == 'in-progress'){
      return 'En Proceso'; 
    }
    else if(service['status'] == 'finalized'){
      return 'Finalizado'; 
    }
    else{
      return 'Cancelado';
    }

  }
}