import 'package:flutter/material.dart';
import 'package:my_app/demo_apps/form/page/login_form_page.dart';

class ProfileListWidget extends StatelessWidget {
  const ProfileListWidget
  ({super.key,
      //attributes
      this.prefixIcon,
      this.featureName,
      this.suffixIcon, 
      this.routeName, required featureMethod,
    });

    final Icon?prefixIcon;
    final String?featureName;
    final Icon?suffixIcon;
    final dynamic routeName;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical:10),
          child: 
          InkWell(onTap: (){
            // builder: (_)=> EditProfilePage()
            Navigator.push(context, 
            MaterialPageRoute(
              // routeName
              builder: (_)=>routeName??"HomePage"));
          },
          child:
            Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  prefixIcon??Icon(Icons.error),
                  SizedBox(width: 8),
                  Text(featureName??"Text", 
                  style: TextStyle(fontSize: 14),),
                ],
              ),
              suffixIcon??Icon(Icons.error),
            ],
          ),
          ),
        ),
      
      ],

    );
  }
}

  void _showLogoutDialog(BuildContext context){
    showDialog(context: context,
    builder: (BuildContext context){
      return AlertDialog(
        //title
        title: Text("Conform Logout?"),
        //content description
        content: Text("This will close your application. You'll need to re-login."),
        //background color
        backgroundColor: Colors.blue.shade50,
        //elevation
        elevation: 8.0,
        //actions 
        actions: [
          TextButton(
            onPressed:(){
              Navigator.of(context).pop(); 
              // close the dialog and continue to the same page
            }, 
            child: Text(
              "Cancel", 
              style: TextStyle(
                color: Colors.red.shade300,
                decoration: TextDecoration.underline,
                decorationColor: Colors.red.shade300,),),
          ),
          TextButton(onPressed: (){
            Navigator.of(context).pop(); 
            // close the dialog with navigation to home page with a scaffold message
            Navigator.push(
            context, 
            MaterialPageRoute(builder: (_)=>LoginFormPage()),
      );

      /*if user press yes logout the screen with message on snack bar successfully logout else continue to the same screen.*/

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('You have successfully Logged out. Please re-login to continue.'), 
          backgroundColor: Colors.red.shade300,
        ),
        );
      }, child: Text(
        "Ok",
        style: TextStyle(
          decoration: TextDecoration.underline),
          ),
      ),
        ],
      );
    });
  }

class LogoutListWidget extends StatelessWidget {
  const LogoutListWidget
  ({super.key,
      //attributes
      this.prefixIcon,
      this.featureName,
      this.suffixIcon, 
      this.routeName, required featureMethod,
    });

    final Icon?prefixIcon;
    final String?featureName;
    final Icon?suffixIcon;
    final dynamic routeName;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(),
        SizedBox(height: 5,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical:10),
          child: 
          InkWell(onTap: (){
            Navigator.push(context, 
            MaterialPageRoute(
              // routeName
              builder: (_)=>routeName??"LoginFormPage"));
          },
          child:
            Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  prefixIcon??Icon(Icons.error),
                  SizedBox(width: 8),
                  InkWell(
                    onTap:(){
                     _showLogoutDialog(context);
                    },
                    child: Text(
                    featureName??"Text",
                    style: TextStyle(
                    fontSize: 14,
                    color: Colors.red.shade300,
                    ), 
                  ),
                  ),
                ],
              ),
              suffixIcon??Icon(Icons.error),
            ],
          ),
          ),
        ),
      ],
    );
  }
}



