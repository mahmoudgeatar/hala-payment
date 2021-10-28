import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hala/model/amount_model.dart';
import 'package:hala/services/amount_service.dart';

class HomeProvider extends ChangeNotifier{

  AmountService _amountService =AmountService();


  bool getAmount=false;
  changeLoaded(value){
    getAmount=value;
  }

  AmountModel userInfo;

  fetchAmountFunction(token) async {
    changeLoaded(true);
    await _amountService.amountMethod(
        token
    );
    if (_amountService.amountInfo.statusCode == 200) {
      var jsonData = _amountService.amountInfo.body;
      userInfo = AmountModel.fromJson(json.decode(jsonData));
      changeLoaded(false);
      notifyListeners();
    } else {
      getAmount=false;
      print("errorsss");
      notifyListeners();
    }
    notifyListeners();
  }

}