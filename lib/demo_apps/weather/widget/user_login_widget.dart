import 'package:flutter/material.dart';

bool isUserLoggedIn =true;
class UserLoginWidget extends StatelessWidget 
{
  const UserLoginWidget(
    bool isUserLoggedIn, 
    {
      super.key,
    }
  );

  @override
  Widget build(BuildContext context) {
    /* check login status and return the appropriate widget login link or user with profile image and popup menu */
    
    if(!isUserLoggedIn){
      return 
      const 
      Text("Login?",
      textAlign: TextAlign.right,
      style: TextStyle(
        color: Colors.white70),
        );
      
    }else{
      return SizedBox(
        width: 40, // Circle diameter = 2 * radius
        height: 40,
        child: 
        ClipOval(
          child: Center(
            child: SizedBox(
              width: 50, // Size of the image inside the circle
              height: 50,
              child: 
              Image.asset('assets/images/profile.png'),
            ),
          ),
        ),
      );
    }
  }
}