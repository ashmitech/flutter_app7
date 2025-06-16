import 'package:flutter/material.dart';
import 'package:my_app/news_apps/screens/settings_page.dart';

class ResetPasswordForm extends StatefulWidget {
  const ResetPasswordForm({super.key});

  @override
  State<ResetPasswordForm> createState() => 
  _ResetPasswordFormState();
}

class _ResetPasswordFormState extends State<ResetPasswordForm> {
  final _formKey= GlobalKey<FormState>();
  bool? value= false; //initialize as nullable bool 
  bool _obscureText=true;

  void _submit(){
    final isValid=_formKey.currentState!.validate();
    if(!isValid){
      return;
      }
      else{
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(
          "Your Password has been Reset. Please re-login to continue",
            style: TextStyle(
              color: Colors.white,
              backgroundColor: Colors.green.shade400,
            ),
          )
        ),
      );
    }
    _formKey.currentState!.save();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: const Color.fromRGBO(25, 118, 210, 1),
        foregroundColor: Colors.white,
        title: Text("News Apps Demo", 
        style: TextStyle(color: Colors.white70,
         fontWeight: FontWeight.bold)),
        centerTitle: false,
         actions: [
          Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: 
          InkWell(
          onTap: () => Navigator.push(context, 
          MaterialPageRoute(builder: (_)=>SettingsPage())),
          child: Icon(Icons.zoom_in_outlined, color: Colors.white,),
          )
          
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:20.0),
            child: IconButton(
            icon: const Icon(Icons.reset_tv_outlined),
            tooltip: 'Reset Password',
            onPressed: () {
              // handle the press
            },
          ),
            
            ),
            
            ],
      ),
      body:
      ListView(
        children: [
          SizedBox(height: 15.0,),
          Center(
                  child: Text("Reset Password Form",
                  style:TextStyle(
                    fontSize:24.0,
                    fontWeight:FontWeight.bold),
                  ),
                ),
          
          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0,vertical: 0
              ),
              child: Column(
                children: <Widget>[
                  
                  SizedBox(height:MediaQuery.of(context).size.width*0.01,
                  ),
                  
                  TextFormField(
                    // controller: passwordController,
                  obscureText:_obscureText,
                  decoration: InputDecoration(
                  border:OutlineInputBorder(),
                  labelText: "New Password",
                  prefixIcon: Icon(Icons.security),
                  suffixIcon: IconButton(
                    icon: Icon( 
                      _obscureText ? Icons.visibility_off : Icons.visibility,),
                      onPressed: (){
                        setState(() {
                          _obscureText=!_obscureText;
                        });
                      }), 
                    ),
                    validator:(value){
                      if(value!.isEmpty){
                        return 'Enter a enter your new password!';
                        
                      }else if(!RegExp(
                        r'^(?=.*[0-9])(?=.*[!@#$%^&*(),.?":{}|<>])[A-Za-z\d!@#$%^&*(),.?":{}|<>]{8,}$').hasMatch(value)){
                        return 'Please enter a valid password with atleast 8 characters, number and special character';
                      }
                      return null;
                    },
                    ),
              
                  SizedBox(height:MediaQuery.of(context).size.width*0.01,
                  ),
                  TextFormField(
                    obscureText:_obscureText,
                  decoration: InputDecoration(
                  border:OutlineInputBorder(),
                  labelText: "Re-type Password",
                  prefixIcon: Icon(Icons.security),
                  suffixIcon: IconButton(
                    icon: Icon( 
                      _obscureText ? Icons.visibility_off : Icons.visibility,),
                      onPressed: (){
                        setState(() {
                          _obscureText=!_obscureText;
                        });
                      }), 
                    ),
                    validator:(value){
                      if(value!.isEmpty){
                        return 'Pleas re-enter your new password!';
                        
                      }else if(!RegExp(
                        r'^(?=.*[0-9])(?=.*[!@#$%^&*(),.?":{}|<>])[A-Za-z\d!@#$%^&*(),.?":{}|<>]{8,}$').hasMatch(value)){
                        return 'Please enter a valid password with atleast 8 characters, number and special character';
                      }
                      return null;
                    },
                    ),  
                     SizedBox(height:MediaQuery.of(context).size.width*0.025),

                  SizedBox(height: MediaQuery.of(context).size.width*0.1,),
                    SizedBox(
                      width:double.infinity,
                      child:ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all(Colors.blue.shade600),
                        ),
                        child: 
                        Padding(padding: const EdgeInsets.all(8.0),
                          child: Text('S U B M I T',
                          style:TextStyle(
                            color:Colors.white,
                            fontSize:14,
                          ),
                          ),
                        ),
                        onPressed: ()=> _submit(),
                      ),
                    ),
                ],
              ),
            ),   
          )
        ],
      ),
    );
  }
}

class RegistrationFormWidget extends StatelessWidget {
  final dynamic prefixIcon;
  final dynamic labelText;

  const RegistrationFormWidget
  ({super.key, 
      //attributes
      this.labelText,
      this.prefixIcon,
      required featureValidationMethod,
  });

  @override
  Widget build(BuildContext context) {
    return 
    TextFormField( 
                    decoration: 
                    InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Full Name",
                    prefixIcon: Icon(Icons.near_me),
                    ),
                  keyboardType: TextInputType.text,
                  validator:(value){
                    if(value!.isEmpty||(value.length<5)){
                      return 'Please enter your full name';
                    }
                    return null;
                  }
                  );
  }
}

class LargeSizedBoxWidget extends StatelessWidget {
  const LargeSizedBoxWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return 
    SizedBox(height:MediaQuery.of(context).size.width*0.1);
  }
}

class SmallSizedBoxWidget extends StatelessWidget {
  const SmallSizedBoxWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return 
    SizedBox(height:MediaQuery.of(context).size.width*0.01);
  }
}


