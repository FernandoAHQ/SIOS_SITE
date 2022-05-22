import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:sios_app/services/services.dart';

class HistoryView extends StatelessWidget {
  const HistoryView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final historyProvider = Provider.of<ServiceQuery>(context);    

    historyProvider.getHistory();

    return ListView.builder(
      itemCount: 15,
      itemBuilder: (_,int index) => const _HistoryCard(),
      physics: const BouncingScrollPhysics(),
    );
  }
}

class _HistoryCard extends StatelessWidget {
  const _HistoryCard({ Key? key }) : super(key: key);

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
                children: const [
    
                  Text(
                  'title',
                  // service['report']['title'],
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 17
                  ),),
    
                  Text(
                  'department',
                  // service['report']['department']['name'],
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16
                  ),),
                  
                  Text(
                  'createdAt',
                  // service['report']['createdAt'],
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                    color: Color(0xFF787878),
                    fontWeight: FontWeight.bold,
                  ),)
                  
                ],
              ),
            ),
    
            const Expanded(
              // child: Text('En proceso',textAlign: TextAlign.center,),
              child: Text('status',textAlign: TextAlign.center,maxLines: 1,overflow: TextOverflow.ellipsis,),
            )
    
          ],
        ),
        
      ),
    );
  }

}