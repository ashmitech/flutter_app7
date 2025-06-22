import 'package:flutter/material.dart';
import 'package:my_app/news_apps/screens/settings_page.dart';
import 'package:path/path.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _formKey = 
  GlobalKey<FormState>();

  final TextEditingController passwordController=TextEditingController();

  void _submit(){
    final isValid=_formKey.currentState!.validate();
    if(!isValid){
      return;
    }else{
      ScaffoldMessenger.of(context as BuildContext).showSnackBar(
        SnackBar(
          backgroundColor: Colors.yellow.shade300,
          content: Text(
            "OTP Sent Successfully. Please check your SMS",
          ),
          )
      );
    }
    _formKey.currentState!.save();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: 
      AppBar(
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
            tooltip: 'Forgot Password',
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
            height: MediaQuery.of(context).size.width*0.15,),
          Center(
            child: Text("Forgot Password Form",
            style:TextStyle(
              fontSize:24.0,
              fontWeight:FontWeight.bold),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width*0.015,),
          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child:
              Column(
                children: [

                  TextFormField( 
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                  border:OutlineInputBorder(),
                  labelText:'Mobile Number',
                  prefixText: '+977  ',
                  prefixIcon: Icon(Icons.phone),
                  ),
                
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
            height: MediaQuery.of(context).size.width*0.15,),
            
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
        ],
      )
    );
  }

  @override
  void dispose(){
    passwordController.dispose();
    super.dispose();
  }
}








