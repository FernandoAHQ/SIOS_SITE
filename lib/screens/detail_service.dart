import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sios_app/services/service_query.dart';
import 'package:sios_app/theme/app_theme.dart';

class DetailService extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

  final size = MediaQuery.of(context).size;
  final idreport = ModalRoute.of(context)?.settings.arguments.toString();
  final serviceProv = Provider.of<ServiceQuery>(context,listen: true);
  serviceProv.getService(idreport);
  final service = serviceProv.service;
  // print('idreport: ' + idreport!);

  if( serviceProv.isLoading! ){
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  else{
    
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
                  child: const Image(image: AssetImage('assets/status_icons/Green-Status-Icon1.png'),fit: BoxFit.cover,),
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
                            color: Colors.green
                          )  
                        ),
                        padding: const EdgeInsets.all(5),
                        child: Text(
                          service!.status,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: Colors.green
                          ),
                        )
                      ),

                      //*Titulo del servicio 

                      Text(
                        service.title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
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
                        service.createdAt,
                        textAlign: TextAlign.center,
                        style: TextStyle(
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
                    padding: EdgeInsets.all(8.0),
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
                  child: Text('Comenzar',
                  style: TextStyle(
                    color: Colors.white
                  ),),
                  onPressed: (){} 
                )
                
              ],
            )
           
          ],
        ),
      ),

      
    );
  }

  }
}