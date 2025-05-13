import 'package:flutter/material.dart';

bool isUserLoggedIn =false;
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
    //check login status and return the appropriate widget
    if(!isUserLoggedIn){
      return const Icon(Icons.verified_user_outlined);
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
              Image.asset('assets/images/profile.jpg'),
            ),
          ),
        ),
      );
    }
  }
}