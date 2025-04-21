import 'package:flutter/material.dart';
import 'package:my_app/demo%20apps/form/page/registration_form.dart';

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  State<MyCustomForm> createState() {
    return _MyCustomFormState();
  } 
}

class _MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();

  void _submit(){
    final isValid = _formKey.currentState!.validate();
    if(!isValid){
      return;
    }else{
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
        
        // leading: Icon(Icons.menu),
        // backgroundColor: Colors.white,
        // foregroundColor: Colors.white,
        // title: Text("Login Form",
        //   style: TextStyle(
        //     fontWeight: FontWeight.bold,
        //     fontSize: 18
        //   ),
        // ),
        // actions: [
        //   Padding(
        //     padding: const EdgeInsets.symmetric(horizontal: 10.0),
        //     child: Icon(Icons.format_align_justify_outlined),
        //     )
        // ],
        // centerTitle: true,

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
                Text("L O G I N ",
                style:TextStyle(
                  fontSize:24.0,
                  fontWeight:FontWeight.bold),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width*0.1,),
                TextFormField( decoration: InputDecoration(
                  labelText:'E-mail'
                  ),
                keyboardType: TextInputType.emailAddress,
                validator:(value){
                    if(value!.isEmpty|| !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)){
                      return 'Please enter a valid email address!';
                    }
                    return null;
                  },
                ),
                SizedBox(height:MediaQuery.of(context).size.width*0.1,
                ),
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
                            decoration: TextDecoration.underline,
                            ),
                          ),
                        onDoubleTap: (){
                          // Navigator.pushNamed(context, "/forgot_password_page")
                        },  
                      ),
                      SizedBox(
                        width: 8.0,
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