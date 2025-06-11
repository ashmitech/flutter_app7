import 'package:flutter/material.dart';
import 'package:my_app/demo_apps/form/page/forgot_password_page.dart';
import 'package:my_app/demo_apps/form/page/registration_form_page.dart';
import 'package:my_app/news_apps/screens/settings_page.dart';

class LoginFormPage extends StatefulWidget {
  const LoginFormPage({super.key});

  @override
  State<LoginFormPage> createState() {
    return _LoginFormPageState();
  }
}

class _LoginFormPageState extends State<LoginFormPage> {
  final _formKey = GlobalKey<FormState>();
  bool _obscureText=true;
  final TextEditingController passwordController =TextEditingController();
  
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
      backgroundColor: Colors.white,
      appBar: AppBar(
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
            icon: const Icon(Icons.login),
            tooltip: 'Login',
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
        Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: <Widget>[
                Center(
                  child: Text("Login Form",
                  style:TextStyle(
                    fontSize:24.0,
                    fontWeight:FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width*0.15,),
                
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
                SizedBox(height:MediaQuery.of(context).size.width*0.1,
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
                Navigator.push(context, 
                MaterialPageRoute<void>(
                  builder: (BuildContext context)
                   => const RegistrationForm(),
                  ),
                
                );
              } 
              
            ),
          ],
        ),
      ],
      ),
    );
  }

  @override
  void dispose(){
    passwordController.dispose();
    super.dispose();
  }
}

 /* TODO: 
      // check login details username and password then redirect to the home page with success message

      // if user click on forgot password then redirect to forgot password screen

      // if user clicks on not registered yet then redirect to the registration screen

      // if user clicks on the show password help to show the password on tap with changed state for few seconds
      */

/**For Mobile number verification in the Form field*/

//       TextFormField(
//   keyboardType: TextInputType.phone,
//   decoration: InputDecoration(labelText: 'Phone Number'),
//   validator: (value) {
//     if (value == null || value.isEmpty) {
//       return 'Please enter your phone number';
//     } else if (!RegExp(r'^\+?\d{10,13}$').hasMatch(value)) {
//       return 'Enter a valid phone number';
//     }
//     return null;
//   },
// )

/**For Email Verification in text field */
// TextFormField( 
                  
//                   decoration: InputDecoration(
//                   labelText:'Mobile Number'
//                   ),
//                 keyboardType: TextInputType.emailAddress,
//                 validator:(value){
//                     if((value!.isEmpty|| !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)) || (value.isEmpty || value.length>10 || value.length<10)){
//                       return 'Please enter a valid phone number!';
//                     }else {
//                     return null;
//                     }
//                   },
//                 )

      