import 'package:flutter/material.dart';
import 'package:sios_app/theme/app_theme.dart';

class DetailService extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

  final size = MediaQuery.of(context).size;
  final idreport = ModalRoute.of(context)?.settings.arguments;

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
                        child: const Text(
                          'Finalizado',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: Colors.green
                          ),
                        )
                      ),

                      //*Titulo del servicio 

                      const Text(
                        'Titulo del Servicio',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold
                        ),
                      ),

                      //*Texto de Ubicacion 
                      
                      const Text(
                        'Ubicacion',
                        textAlign: TextAlign.center,
                      ),

                      //*Texto de Departamento 
                      
                      const Text(
                        'Departamento',
                        textAlign: TextAlign.center,
                      ),

                      //*Texto de Encargado 
                      
                      const Text(
                        'Encargado',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold
                        ),
                      ),

                      // * Texto de Hora
                      
                      const Text(
                        '14-04-2022 11:19:20',
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
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Exercitation tempor elit quis laboris voluptate et culpa in. Culpa sit in nostrud aute esse excepteur ullamco tempor commodo incididunt mollit eiusmod culpa. Laborum qui cillum reprehenderit officia voluptate occaecat ut. Do id proident duis esse fugiat consequat incididunt dolor adipisicing sunt non officia nulla. Adipisicing labore dolore elit aliqua non velit cupidatat velit sit laboris. Ea in duis aliquip ullamco deserunt culpa cupidatat quis elit do exercitation deserunt adipisicing Lorem.'),
                  ),
                  Row(
                    children: const [
                      Text(
                        'Categoria:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Urgenteeeeee perrro Correele sino te corren'),
                      ),
                    ],
                  ),
                ],
              ) 
              )
            
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  child: Text('Comenzar',style: TextStyle(color: Apptheme.primarydark),),
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