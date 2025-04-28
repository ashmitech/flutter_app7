import 'package:flutter/material.dart';

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key});

  @override
  State<RegistrationForm> createState() => 
  _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final _formKey= GlobalKey<FormState>();
  bool? value= false; //initialize as nullable bool 

  void _submit(){
    final isValid=_formKey.currentState!.validate();
    if(!isValid){
      return;
      }
      else{
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(
          "Registration Successful",
            style: TextStyle(
              color: Colors.white,
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
        title: Text("R E G I S T R A T I O N",
          style: TextStyle(
            fontSize: 24.0, 
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body:
      ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
              Text("Please fill the registration form below: "),
            ] 
          ),
          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0,vertical: 0
              ),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: MediaQuery.of(context).size.width*0.1),
                  TextFormField( decoration: InputDecoration(
                    labelText: "Full Name*"
                    ),
                  keyboardType: TextInputType.text,
                  validator:(value){
                    if(value!.isEmpty||(value.length<5)){
                      return 'Please enter your full name';
                    }
                    return null;
                  }
                  ),
              
                  // SizedBox(
                  //   height: MediaQuery.of(context).size.width*0.1),
                  TextFormField( decoration: InputDecoration(
                    labelText: "Address*"
                    ),
                  keyboardType: TextInputType.text,
                  validator:(value){
                    if(value!.isEmpty||(value.length<3)){
                      return 'Please enter your address';
                    }
                    return null;
                  }
                  ),
              
                  // SizedBox(
                  //   height: MediaQuery.of(context).size.width*0.1),
                  TextFormField( decoration: InputDecoration(
                    labelText: "Phone Number*"
                    ),
                  keyboardType: TextInputType.number,
                  validator:(value){
                    if(value!.isEmpty||(value.length<10)){
                      return 'Please enter a valid phone number';
                    }
                    return null;
                  }
                  ),
              
                  // SizedBox(
                  //   height: MediaQuery.of(context).size.width*0.1,),
                  TextFormField( decoration: InputDecoration(
                    labelText:'E-mail*'
                    ),
                  keyboardType: TextInputType.emailAddress,
                  validator:(value){
                      if(value!.isEmpty|| !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)){
                        return 'Please enter a valid email address!';
                      }
                      return null;
                    },
                  ),
                  
                  // SizedBox(height:MediaQuery.of(context).size.width*0.1,
                  // ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Password*"),
                      obscureText:true,
                      validator:(value){
                        if(value!.isEmpty){
                          return 'Enter a valid password!';
                        }
                        return null;
                      },
                    ),
              
                  // SizedBox(height:MediaQuery.of(context).size.width*0.1,
                  // ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Conform Password*"),
                      obscureText:true,
                      validator:(value){
                        if(value!.isEmpty){
                          return 'Re-Enter your password!';
                        }
                        return null;
                      },
                    ),  

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
                        Text("I agree the  "),
                        Text("Terms "),
                        Text("and "),
                        Text("Conditions"),
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
                ],
              ),
            ),   
          )
        ],
      ),
    );
  }
}


