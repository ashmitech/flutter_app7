import 'package:flutter/material.dart';
import 'package:my_app/demo_apps/form/page/login_form_page.dart';
import 'package:my_app/demo_apps/weather/widget/user_login_widget.dart';

class MenuButtonWidget extends StatelessWidget {
  final void Function(String) onSelected;
  const MenuButtonWidget({
    super.key,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    if(!isUserLoggedIn){
      return 
      InkWell(
        onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (_)=> LoginFormPage()),
        ),
        child: Text("Login", style: TextStyle(color: Colors.white),),
      );

    }else{
    return 
    PopupMenuButton <String>(
      color: Colors.blue.shade50,
      onSelected: onSelected,
      itemBuilder: (context)=>
      [
        PopupMenuItem(
          value: 'profile', 
          child: 
          Column(
            children: [
              SizedBox(height:10,),
              Text('Profile'),
                SizedBox(height:5,),
                Divider(
                  color: Colors.blue.shade300,
                ),
            ],
          ),
          ),
        
      PopupMenuItem(
        value: 'logout',
        child: 
          Center(
          child: 
            Text('Logout')
          ,
        ),
        
        ),    
      ], 
      child: UserLoginWidget(isUserLoggedIn));
  }  
  }
}

class LogoutButtonWidget extends StatelessWidget {
  final void Function(String) onSelected;
  const LogoutButtonWidget({
    super.key,
    required this.onSelected,
  });
  
  @override
  Widget build(BuildContext context) {
    if(!isUserLoggedIn){
      return 
      InkWell(
        onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (_)=> LoginFormPage()),
        ),
        child: Text("Login", style: TextStyle(color: Colors.white),),
      );
    }else{
    return 
    PopupMenuButton <String>(
      onSelected: onSelected,
      itemBuilder: (context)=>
      [
        PopupMenuItem(value: 'logout', child: Text('Logout')),    
      ], 
      child: UserLoginWidget(isUserLoggedIn));
    }  
  }
}
  
// TODO: Snackbar to login again if user is logout already
