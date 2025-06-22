import 'package:flutter/material.dart';
import 'package:my_app/news_apps/screens/settings_page.dart';

class TermsAndConditionsPage extends StatelessWidget {
  const TermsAndConditionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
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
            tooltip: 'Read Terms and Condition',
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
                    height: MediaQuery.of(context).size.width*0.1,),
          Center(
                  child: Text("Terms and Conditions",
                  style:TextStyle(
                    fontSize:24.0,
                    fontWeight:FontWeight.bold),
                  ),
                ),
          SizedBox(
                    height: MediaQuery.of(context).size.width*0.1,),

          Center(child: Text("News app demo Terms and Condition here ..."),)
        ],  
      ),
    );
  }
}
