import 'package:flutter/material.dart';
import 'package:esewa_flutter_sdk/esewa_config.dart';
import 'package:esewa_flutter_sdk/esewa_flutter_sdk.dart';
import 'package:esewa_flutter_sdk/esewa_payment.dart';
import 'package:esewa_flutter_sdk/esewa_payment_success_result.dart';
import 'package:my_app/constant/esewa.dart';

class Esewa {
  pay(){
    try{
      
      EsewaFlutterSdk.initPayment(
        esewaConfig: EsewaConfig(
          clientId: kEsewaClientId, 
          secretId: kEsewaSecretKey, 
          environment: Environment.test),

        esewaPayment: EsewaPayment(
          productId: "1d71jd81",
          productName: "Product One",
          productPrice: "20", callbackUrl: '',
          
        ),

        onPaymentSuccess: (EsewaPaymentSuccessResult result) { 
          debugPrint(":::SUCCESS::: "); 
          verify(result);},

        onPaymentFailure: (){
          debugPrint(":::FAILURE:::");
        },

        onPaymentCancellation: (){
          debugPrint(":::CANCELLATION:::");
        }, 
        
        );
      
    }
    on Exception catch(e){
        debugPrint("please try again later. EXCEPTION : ${e.toString()}");
    }
  }

  void verify(EsewaPaymentSuccessResult result) async{
  //TODO: After verification
  }
}


