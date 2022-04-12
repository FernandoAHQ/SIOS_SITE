import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sios_app/providers/providers.dart';


class TodayView extends StatelessWidget {
  const TodayView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final socketprov = Provider.of<SocketProvider>(context);

    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: socketprov.services.length,
      itemBuilder: (_,int index) => _ReportCard(service: socketprov.services[index],)
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
    
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, 'details'),
      child: Container(
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
            
            SizedBox(
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
              child: Text(setStatus(),textAlign: TextAlign.center,maxLines: 1,overflow: TextOverflow.ellipsis,),
            )
    
          ],
        ),
        
      ),
    );
  }

  String setStatus(){

    if (service['status'] == 'pending') {
      return 'Pendiente';
    }
    else if(service['status'] == 'completed'){
      return 'Completao Mi pana'; 
    }
    else if(service['status'] == 'completed'){
      return 'Completao Mi pana'; 
    }
    else if(service['status'] == 'completed'){
      return 'Completao Mi pana'; 
    }
    else if(service['status'] == 'completed'){
      return 'Completao Mi pana'; 
    }
    else{
      return 'de pelos';
    }

  }

}