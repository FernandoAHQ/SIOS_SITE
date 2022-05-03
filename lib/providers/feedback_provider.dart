import 'package:flutter/material.dart';

class FeedBackProvider extends ChangeNotifier{

  GlobalKey<FormState> feedbackKey = GlobalKey<FormState>();

  String description = '';
  String feedBack = '';
  String solution = '';

  bool isNetworkEquip = false;
  bool isTerminalEquip = false;

  changeIsNetworkEquip(bool value){
    isNetworkEquip = value;
    print(value);
    notifyListeners();
  }
  changeisTerminalEquip(bool value){
    isTerminalEquip = value;
    print(value);
    notifyListeners();
  }

  printData (){
    print('descripcion '+description);
    print('feedback '+feedBack);
    print('solucion '+solution);
    print('Equipo terminal '+isTerminalEquip.toString());
    print('Equipo de Red '+isNetworkEquip.toString());
  }

}