import 'package:flutter/material.dart';
import 'package:path/path.dart';

final _formKey = GlobalKey<FormState>();

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      ListView(
        children: [
          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: ForgotPasswordWidget(),),
          ),
        ],
      )
    );
  }
}

//forgot passwod widget
class ForgotPasswordWidget extends StatefulWidget {
  const ForgotPasswordWidget({super.key});

  @override
  State<ForgotPasswordWidget> createState() => _ForgotPasswordWidgetState();
}

class _ForgotPasswordWidgetState extends State<ForgotPasswordWidget> {

  _submit(){
    final isValid=_formKey.currentState!.validate();
  if(!isValid){
    return;
  }else{
    ScaffoldMessenger.of(context as BuildContext).showSnackBar(SnackBar(
      backgroundColor: Colors.blue, 
      content:Text(
        "Password has been successfully rest and sent to you email or phone number")));
    }
    _formKey.currentState!.save();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text("Forgot Password Form",
        style:TextStyle(
          fontSize: 24.0,
          fontWeight:FontWeight.bold),
        ),
        SizedBox(
        height: MediaQuery.of(context).size.width*0.15,),

         TextFormField( decoration: InputDecoration(
                  labelText:'E-mail or Phone'
                  ),
                keyboardType: TextInputType.emailAddress,
                //verification of login either valid email or valid phone number to be entered by the user
                validator:(value){
                    if(value!.isEmpty|| !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)){
                      return 'Please enter a valid email address or Phone Number';
                    }
                    return null;
                  },
                ),
                
        SizedBox(height: MediaQuery.of(context).size.width*0.1,),

        // TODO: Not Robort field verification container design 

        SizedBox(
                    width:double.infinity,
                    child:ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(Colors.blue.shade600),
                      ),
                      child: 
                      Padding(padding: EdgeInsets.all(8.0),
                        child: Text('Submit form',
                        style:TextStyle(
                          color:Colors.white,
                          fontSize:14,
                        ),
                        ),
                      ),
                      onPressed: ()=> _submit,
                    ),
                  ),

      ],
    );
    
  }

  
}






