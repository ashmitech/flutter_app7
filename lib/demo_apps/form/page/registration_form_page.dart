import 'package:flutter/material.dart';
import 'package:my_app/demo_apps/form/page/login_form_page.dart';
import 'package:my_app/demo_apps/form/page/terms_and_conditions_page.dart' show TermsAndConditionsPage;
import 'package:my_app/news_apps/screens/settings_page.dart';

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key});

  @override
  State<RegistrationForm> createState() => 
  _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final _formKey= GlobalKey<FormState>();
  bool? value= true; //initialize as nullable bool 
  bool _obscureText=true;

  void _submit(){
    final isValid=_formKey.currentState!.validate();
    if(!isValid){
      return;
      }
      else{
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.green.shade300,
          content: Text(
          
          "Registration Successful. Thank you.",
            
          )
        ),
      );
    }
    _formKey.currentState!.save();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

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
            icon: const Icon(Icons.app_registration),
            tooltip: 'Edit Profile Details',
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
          SizedBox(
                    height: MediaQuery.of(context).size.width*0.1,),
          Center(
                  child: Text("Registration Form",
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
                  SizedBox(
                    height: MediaQuery.of(context).size.width*0.01),
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
                  ),
                  
                  SizedBox(
                    height: MediaQuery.of(context).size.width*0.05,),

                  TextFormField( 
                    decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Address",
                    prefixIcon: Icon(Icons.home),
                    ),

                  keyboardType: TextInputType.text,
                  validator:(value){
                    if(value!.isEmpty||(value.length<3)){
                      return 'Please enter your address';
                    }
                    return null;
                  }
                  ),
              
                  SizedBox(
                    height: MediaQuery.of(context).size.width*0.05),
                  
                  TextFormField( decoration: InputDecoration(
                    border:OutlineInputBorder(),
                    labelText:'Mobile Number',
                    prefixText: '+977  ',
                    prefixIcon: Icon(Icons.phone),
                    ),
                  keyboardType: TextInputType.number,
                  validator:(value){
                    if(value==null|| value.isEmpty){
                      return 'Please enter your phone number';

                    }else if(!RegExp(r'^\+?\d{10,10}$').hasMatch(value)){
                      return 'Enter a valid phone number';
                    }
                    return null;
                  },
                  ),
              
                  SizedBox(
                    height: MediaQuery.of(context).size.width*0.05,),
                  TextFormField( 
                    decoration: InputDecoration(
                    border:OutlineInputBorder(),
                    labelText:'E-mail Address',
                    prefixIcon: Icon(Icons.email),
                    ),
                  keyboardType: TextInputType.emailAddress,
                  validator:(value){
                      if(value!.isEmpty|| !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)){
                        return 'Please enter a valid email address!';
                      }
                      return null;
                    },
                  ),
                  
                  SizedBox(height:MediaQuery.of(context).size.width*0.05,
                  ),
                  
                  TextFormField(
                    // controller: passwordController,
                  obscureText:_obscureText,
                  decoration: InputDecoration(
                  border:OutlineInputBorder(),
                  labelText: "Password",
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
                        return 'Enter a enter your password!';
                        
                      }else if(!RegExp(
                        r'^(?=.*[0-9])(?=.*[!@#$%^&*(),.?":{}|<>])[A-Za-z\d!@#$%^&*(),.?":{}|<>]{8,}$').hasMatch(value)){
                        return 'Please enter a valid password with atleast 8 characters, number and special character';
                      }
                      return null;
                    },
                    ),
              
                  SizedBox(height:MediaQuery.of(context).size.width*0.05,
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
                        return 'Pleas re-enter your password!';
                        
                      }else if(!RegExp(
                        r'^(?=.*[0-9])(?=.*[!@#$%^&*(),.?":{}|<>])[A-Za-z\d!@#$%^&*(),.?":{}|<>]{8,}$').hasMatch(value)){
                        return 'Please enter a valid password with atleast 8 characters, number and special character';
                      }
                      return null;
                    },
                    ),  
                     SizedBox(height:MediaQuery.of(context).size.width*0.025),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Checkbox(
                          tristate: false,
                          value: value,
                          onChanged:(bool? newValue){
                            setState((){
                              value= newValue;
                            });
                          }
                        ),
                        SizedBox(width: 4.0,),
                        Text("I agree the"),
                        SizedBox(width: 4.0,),
                        
                        InkWell(
                          onTap:()=>Navigator.push(context, 
                          MaterialPageRoute(builder: (BuildContext context)=>const TermsAndConditionsPage(),)),

                          child: Text("Terms and Conditions", 
                          style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.blue,
                        ),
                        )

                        ),
                        
                      ],
                    ),
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

                  SizedBox(height: MediaQuery.of(context).size.width*0.1,),
                    
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Already Registered?"),
                        SizedBox(width: 8.0,),
                        InkWell(
                          child: Text("Login here", 
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.blue,
                              decoration:TextDecoration.underline, 
                              decorationColor: Colors.blue,
                              ),
                          ),

                          onTap:(){
                            Navigator.push(context, 
                            MaterialPageRoute<void>(
                              builder: (BuildContext context)
                              => const LoginFormPage(),
                              ),
                            );
                          } 
                        ),
                      ],
                    ),
                  SizedBox(height: MediaQuery.of(context).size.width*0.1,),
                ],
              ),
            ),   
          )
        ],
      ),
    );
  }
}




