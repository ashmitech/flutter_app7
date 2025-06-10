import 'package:flutter/material.dart';
import 'package:my_app/demo_apps/form/page/login_form_page.dart';
import 'package:my_app/news_apps/widgets/menu_button_widget.dart';

class LogoutWidget extends StatefulWidget {
  const LogoutWidget({super.key});

  @override
  State<LogoutWidget> createState() => _LogoutWidgetState();
}

class _LogoutWidgetState extends State<LogoutWidget> {
  // function to handle the navigation menu
  void _onMenuSelected(BuildContext context, String value){
    switch (value){
      case 'logout':
      _showLogoutDialog(context);
      break;
    }
  }

  void _showLogoutDialog(BuildContext context){
    showDialog(context: context,
    builder: (BuildContext context){
      //if user press yes logout the screen with message on snack bar successfully logout and if user press no, continue to the same screen.
      return AlertDialog(
        title: Text("Conform Logout"),
        content: Text("Are you sure you waht to log out?"),
        actions: [
          //cancel 
          TextButton(
            onPressed:(){
              Navigator.of(context).pop(); // close the dialog
            }, 
            child: Text("Cancel"),
          ),
          
          // Yes
          TextButton(onPressed: (){
            Navigator.of(context).pop(); //close the dialog

            Navigator.push(
            context, 
            MaterialPageRoute(builder: (_)=>LoginFormPage()),
            );
            
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: 
              Text("You have successfully Logged out. Please login again to continue"), backgroundColor: Colors.red,),  
            );
            },
          child: Text("Yes"),
          ),
        ],
      );
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return 
    Row(children: [
      MenuButtonWidget(
                  onSelected: (value) => _onMenuSelected(context, value)
                  ),
    ],);
  }
}