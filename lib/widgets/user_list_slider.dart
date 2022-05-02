import 'package:flutter/material.dart';
class UserListSlider extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    
    return Container(
      // color: Colors.red,
      width: double.infinity,
      height: size.height *.1,

      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (_,int index) => _UserCircleAvatar()
      ),
      
    );
  }
}

class _UserCircleAvatar extends StatelessWidget {
  const _UserCircleAvatar({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      width: size.height*.1,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: const FadeInImage(
      
          fit: BoxFit.cover,
          image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSzHQv_th9wq3ivQ1CVk7UZRxhbPq64oQrg5Q&usqp=CAU'),
          placeholder: AssetImage('assets/loading.gif'),
        
        ),
      ),
    );
  }
}