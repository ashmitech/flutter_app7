import 'package:flutter/material.dart';
import 'package:my_app/demo_apps/form/page/forgot_password_page.dart';
import 'package:my_app/demo_apps/form/page/registration_form_page.dart';

class LoginFormPage extends StatefulWidget {
  const LoginFormPage({super.key});
 
  @override
  State<LoginFormPage> createState() {
    return _LoginFormPageState();
  } 
}

class _LoginFormPageState extends State<LoginFormPage> {
  final _formKey = GlobalKey<FormState>();

  void _submit(){
    final isValid = _formKey.currentState!.validate();
    if(!isValid){
      return;
    }else{
      // TODO: 
      // check login details username and password then redirect to the home page with success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.green,
          content:Text(
            "Successfully Login",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        )
      );
    }
    _formKey.currentState!.save();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body:
      ListView(
        children: [
          Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: <Widget>[
                Text("Login Form",
                style:TextStyle(
                  fontSize:24.0,
                  fontWeight:FontWeight.bold),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width*0.15,),
                
                TextFormField( decoration: InputDecoration(
                  labelText:'E-mail or Phone'
                  ),
                keyboardType: TextInputType.emailAddress,
                validator:(value){
                    if((value!.isEmpty|| !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)) || (value.isEmpty || value.length>10 || value.length<10)){
                      return 'Please enter a valid email address or phone number!';
                    }else {
                    return null;
                    }
                  },
                ),
                SizedBox(height:MediaQuery.of(context).size.width*0.1,
                ),
                //TODO: show and hide password field
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Password"),
                    obscureText:true,
                    validator:(value){
                      if(value!.isEmpty){
                        return 'Enter a valid password!';
                      }
                      return null;
                    },
                  ),

                  SizedBox(height: MediaQuery.of(context).size.width*0.1,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        child: Text("Forgot Password?", 
                          style: TextStyle(
                            color: Colors.grey,
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.grey,
                            ),
                          ),
                        onTap: (){
                          Navigator.pushAndRemoveUntil(context, 
                          MaterialPageRoute(builder: (BuildContext context)
                          =>const ForgotPasswordPage(),
                          ), ModalRoute.withName('/forgot_password_page'),
                          );
                        },  
                      ),
                      SizedBox(
                        width: 8.0,
                        ),                      
                    ],
                  ),
                  
                  SizedBox(height: MediaQuery.of(context).size.width*0.15,),
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
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Don't have login details?"),
            SizedBox(width: 8.0,),
            InkWell(
              child: Text("Register here", 
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.blue,
                  decoration:TextDecoration.underline, 
                  decorationColor: Colors.blue,
                  ),
               ),
              onTap:(){
                Navigator.pushAndRemoveUntil(context, 
                MaterialPageRoute<void>(
                  builder: (BuildContext context)
                   => const RegistrationForm(),
                  ),
                  ModalRoute.withName('/registration_page'),
                );
              } 
            ),
          ],
        ),
      ],
      ),
    );
  }
}