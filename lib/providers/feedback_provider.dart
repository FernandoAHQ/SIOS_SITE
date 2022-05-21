import 'package:flutter/material.dart';

class FeedBackProvider extends ChangeNotifier{

  GlobalKey<FormState> feedbackKey = GlobalKey<FormState>();

  String description = '';
  String feedBack = '';
  String solution = '';

  bool isNetworkEquip = false;
  bool isTerminalEquip = false;

  List<String> staff = [];

  changeIsNetworkEquip(bool value){
    isNetworkEquip = value;
    notifyListeners();
  }
  changeisTerminalEquip(bool value){
    isTerminalEquip = value;
    notifyListeners();
  }

  tap( String value){
    if (staff.contains(value)) {
      staff.remove(value);
    }
    else{
      staff.add(value);
    }

    notifyListeners();
    
  }

  bool checkSelected( String value ){

    if (staff.contains(value)) {
      return true;
    } else {
      return false;
    }
    
  }


  printData (){
    print('Descripcion '+description);
    print('Feedback '+feedBack);
    print('Solucion '+solution);
    print('Equipo terminal '+isTerminalEquip.toString());
    print('Equipo de Red '+isNetworkEquip.toString());
    print('Staff '+staff.toString());
  }

  restartValues(){
    description = '';
    feedBack = '';
    solution = '';
    isNetworkEquip = false;
    isTerminalEquip = false;
    staff = [];
  }

}