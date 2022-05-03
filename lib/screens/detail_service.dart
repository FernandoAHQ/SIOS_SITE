import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'package:sios_app/models/models.dart';
import 'package:sios_app/services/services.dart';
import 'package:sios_app/theme/app_theme.dart';

class DetailService extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

  final size = MediaQuery.of(context).size;
  final idreport = ModalRoute.of(context)?.settings.arguments.toString();
  final serviceProv = Provider.of<ServiceQuery>(context,listen: false);



    return FutureBuilder(
      future: serviceProv.getService(idreport),
      builder: (context, snapshot) {

        if ( !snapshot.hasData ) {
          return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
        }
        final Service service = snapshot.data as Service;
        
      var parsedDate = DateFormat('KK:mm:ss').format(DateTime.parse(service.createdAt));

      return Scaffold(
          appBar: AppBar(
            backgroundColor: Apptheme.primarylight,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 5),
            child: Column(
              children: [

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    //* Severity Image
                    Container(
                      child: Image(image: setImage(service.severity),fit: BoxFit.cover,),
                      height: size.height*0.1,
                      width: size.height*0.1,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100)
                      ),
                    ),

                    SizedBox(
                      width: size.width*.5,
                      child: Column(
                        children: [
                          
                          //* Status Widget
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              border: Border.all(
                                color: setStatusColor(service.status)
                              )  
                            ),
                            padding: const EdgeInsets.all(5),
                            child: Text(
                              setStatus(service.status),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: setStatusColor(service.status)
                              ),
                            )
                          ),

                          //*Titulo del servicio 

                          Text(
                            service.title,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold
                            ),
                          ),

                          //*Texto de Departamento 
                          
                          Text(
                            service.department,
                            textAlign: TextAlign.center,
                          ),

                          // * Texto de Hora
                          
                          Text(
                            parsedDate,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Apptheme.secondary,
                              fontSize: 12
                            ),
                          ),

                        ],
                      ),
                    )

                  ],
                ),

                Expanded(child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      const Text(
                        'Descripcion:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(service.description),
                      ),
                      // Row(
                      //   children: const [
                      //     Text(
                      //       'Categoria:',
                      //       style: TextStyle(
                      //         fontWeight: FontWeight.bold,
                      //         fontSize: 14
                      //       ),
                      //     ),
                      //     Padding(
                      //       padding: EdgeInsets.all(8.0),
                      //       child: Text('Urgenteeeeee perrro Correele sino te corren'),
                      //     ),
                      //   ],
                      // ),
                    ],
                  ) 
                  )
                
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [

                    MaterialButton(
                      color: Apptheme.primarydark,
                      child: const Text('Comenzar',
                      style: TextStyle(
                        color: Colors.white
                      ),),
                      // onPressed: ()=> Navigator.pushNamed(context, 'feedback')
                      onPressed: ()=> Navigator.pushNamed(context, 'feedback')
                    )
                    
                  ],
                )
              
              ],
            ),
          ),

          
        );
      },
    );
 
    
  }

}

AssetImage setImage(String severity){
    if (severity == 'severe') {
      return const AssetImage('assets/status_icons/Red-Status-Icon.png');
    }
    else if (severity == 'elevated') {
      return const AssetImage('assets/status_icons/Blue-Status-Icon.png');
    }
    else if (severity == 'high') {
      return const AssetImage('assets/status_icons/Orange-Status-Icon.png');
    }
    else {
      return const AssetImage('assets/status_icons/Green-Status-Icon1.png');
    }
  }

 Color setStatusColor(serviceStatus){
    if (serviceStatus == 'pending') {
      return const Color(0xfff8b364);
    }
    else if(serviceStatus == 'assigned'){
      return const Color(0xff58c0e6); 
    }
    else if(serviceStatus == 'in-progress'){
      return const Color(0xfff8b364); 
    }
    else if(serviceStatus == 'finalized'){
      return const Color(0xff9bcb87); 
    }
    else{
      return const Color(0xffe36363);
    }
  }

  String setStatus(serviceStatus){

    if (serviceStatus == 'pending') {
      return 'Pendiente';
    }
    else if(serviceStatus == 'assigned'){
      return 'Asignado'; 
    }
    else if(serviceStatus == 'in-progress'){
      return 'En Proceso'; 
    }
    else if(serviceStatus == 'finalized'){
      return 'Finalizado'; 
    }
    else{
      return 'Cancelado';
    }

  }
