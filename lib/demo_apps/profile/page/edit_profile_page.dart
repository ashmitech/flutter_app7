import 'package:flutter/material.dart';
import 'package:my_app/demo_apps/form/page/registration_form_page.dart';
import 'package:my_app/demo_apps/profile/page/profile_page.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {

  final _formKey= GlobalKey<FormState>();
  bool? value= false; //initialize as nullable bool 
  bool _obscureText=true;

  void _submit(){
    final isValid=_formKey.currentState!.validate();
    if(!isValid){
      return;
      }
      else{
        // Navigator.push(context, MaterialPageRoute(builder: ()=>ProfilePage()));
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(
          "Your profile has been updated successfully.",
            style: TextStyle(
              color: Colors.white,
              // backgroundColor: Colors.black,
              
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
      backgroundColor: Colors.white,
      appBar: 
      AppBar(
        backgroundColor: Colors.blue.shade600,
        foregroundColor: Colors.white,
        centerTitle:false,
        title:Text("Edit Profile", 
        style: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
          color: Colors.white
        ),
        ),
        actions:
         <Widget>[
          IconButton(
            icon: const Icon(Icons.edit),
            tooltip: 'Edit Profile',
            onPressed: () {
              // handle the press
            },
          ),
        ],
      
      ),
      body:

      Container(
        margin: EdgeInsets.all(0.0),
        padding: EdgeInsets.all(0.0),
        child:

          // 
         ListView(
        children: [
          SizedBox(height: 15.0,),
          Center(
                  child: Text("Edit Profile Form",
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

                  Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 2),
                  child: Stack(
                    alignment: const Alignment(0.6, 0.6),
                    children: [
                      Expanded(
                        child: const CircleAvatar(
                        radius: 55,
                        backgroundImage: AssetImage(
                          'assets/images/profile.jpg',
                        ),
                        backgroundColor: Colors.white,
                       ),),
                       
                       Container(
                        decoration: const BoxDecoration(),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 108.0),
                          child: 
                          InkWell(onTap: (){
                            // permission to the camera and gallery
                          }, 
                          child:
                          Container( 
                            padding: EdgeInsets.all(2),
                            margin: EdgeInsets.all(2),
                            decoration: 
                              BoxDecoration(
                                border: Border.all(color:Colors.white10, width: 1),
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(color: Colors.white),
                                ],
                                color: Colors.white54),
                                child:
                                Icon(Icons.camera_alt_outlined, 
                             )
                           ),),
                        ),
                        ),
                    ],
                  ),
                ),

                  SizedBox(
                    height: MediaQuery.of(context).size.width*0.1),
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
                    height: MediaQuery.of(context).size.width*0.01,),

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
                    height: MediaQuery.of(context).size.width*0.01),
                  
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
                    height: MediaQuery.of(context).size.width*0.01,),
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

                ],
              ),
            ),   
          )
        ],
      ),  
      ),
    );

  }
}
// TODO: on tap change grant the access to camera and gallery