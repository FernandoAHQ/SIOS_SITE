import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:sios_app/providers/providers.dart';
import 'package:sios_app/services/auth_service.dart';
import 'package:sios_app/theme/app_theme.dart';

class HomeScreen extends StatelessWidget {
   
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final loginService = Provider.of<AuthService>(context,listen: false);
    final user = loginService.user;

    final socketprov = Provider.of<SocketProvider>(context);

    return Scaffold(

      backgroundColor: Apptheme.primarylight,

      appBar: AppBar(
        backgroundColor: Apptheme.primarylight,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.dehaze),
          onPressed: () async {

            socketprov.disconnect();

            await loginService.logout();
            Navigator.pushReplacementNamed(context, 'login');

          },
        ),

      ),

      body: Column(
        children: [
      
          Container(
            height: size.height*.15,
            decoration: const BoxDecoration(
              color: Apptheme.primarylight,
            ),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width*.02),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100)
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: FadeInImage(
                        height: size.height*.08,
                        width: size.height*.08,
                        placeholder: const AssetImage('assets/loading.gif'),
                        image: NetworkImage(user.image)),
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Hola',style: TextStyle(color: Apptheme.white,fontSize: 16),),
                    Text(user.name,style: const TextStyle(color: Apptheme.white,fontWeight: FontWeight.bold,fontSize: 24),),
                  ],
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Apptheme.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(30) ,topRight: Radius.circular(30))
              ),
              width: double.infinity,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width*.1,vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Hoy',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                        Container(
                          width: size.height*.04,
                          height: size.height*.04,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadiusDirectional.circular(100),
                            color: const Color(0xfffcefe0)
                          ),
                          child: Center(child: Text(socketprov.services.length.toString(),style: const TextStyle(color: Color(0xffff687b),fontSize: 18,fontWeight: FontWeight.w600)))
                        ),
                      ],
                    ),
                  ),
                
                  Expanded(
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: socketprov.services.length,
                      itemBuilder: (_,int index) => _ReportCard(service: socketprov.services[index],)
                    ),
                  )
            
                ],
              ),
            ),
          ),
        ],
      ),

    );
  }
}

class _ReportCard extends StatelessWidget {

  final dynamic service;

  const _ReportCard({
    this.service
  });

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    
    return Container(
     // width: size.width,
      height: size.height*.15,
      padding: const EdgeInsets.all(10),

      child: Row(
        children: [

          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Container(
              height: size.height*.1,
              width: size.height*.1,
              decoration: BoxDecoration(
                color: const Color(0xff9bcb87),
                borderRadius: BorderRadius.circular(100)
              ),
            ),
          ),
          
          Container(
             width: size.width*0.5,
            child: Column(
              mainAxisAlignment:MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(service['report']['title'],
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                textAlign: TextAlign.start,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 17
                ),),

                Text(service['report']['department']['name'],
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16
                ),),
                
                Text(service['report']['createdAt'],
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: const TextStyle(
                  color: Color(0xFF787878),
                  fontWeight: FontWeight.bold,
                ),)
                
              ],
            ),
          ),

          Expanded(
            // child: Text('En proceso',textAlign: TextAlign.center,),
            child: Text(setStatus(),textAlign: TextAlign.center,),
          )

        ],
      ),
      
    );
  }

  String setStatus(){

    if ( service['status']== 'pending') {
      return 'Pendiente';
    }
    else{
      
    }

    return 'de pelos';
  }

}