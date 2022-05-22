import 'package:flutter/material.dart';

class FeedBackProvider extends ChangeNotifier{

  GlobalKey<FormState> feedbackKey = GlobalKey<FormState>();

  String description = '';
  String feedBack = '';
  String solution = '';

  bool isNetworkEquip = false;
  bool isTerminalEquip = false;

  List<String> staff = [];
  List<String> device = [];

  changeIsNetworkEquip(bool value){
    isNetworkEquip = value;
    isNetworkEquip
    ?device.add('red')
    :device.remove('red');
    notifyListeners();
  }
  changeisTerminalEquip(bool value){
    isTerminalEquip = value;
    isTerminalEquip
    ?device.add('terminal')
    :device.remove('terminal');
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
    print('descripcion: $description');
    print('feedback: $feedBack');
    print('solucion: $solution');
    print('device: $device');
    print('staff: $staff');
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