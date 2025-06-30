import 'package:flutter/material.dart';

class SwitchDemo extends StatefulWidget {
  const SwitchDemo({super.key});
  @override
  State<SwitchDemo> createState() => _SwitchDemoState();

}

class _SwitchDemoState extends State<SwitchDemo> {
  //initialize of widget
  bool firstBool =false;
  bool secondBool = false;

  @override
  Widget build(BuildContext context) {
    var image = Image.asset('images/profile.png');
    return Scaffold(
      appBar: AppBar(),
      body: 
        ListView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(15.0),

      children: [
        const SizedBox(
          height: 20,
        ),
        //material switch
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Change Language(NEP/ENG)', 
              style: TextStyle(fontSize:20.0),
            ),
            Switch(
              value: firstBool, 
              onChanged: (value){
              setState((){
                firstBool=value;
                });
              },
              activeColor: Colors.blue.shade50,
              activeTrackColor: Colors.white,
              inactiveThumbColor: Colors.white,
              inactiveTrackColor: Colors.blue.shade50,
              inactiveThumbImage: AssetImage('assets/images/flag_nepal.png'),
              activeThumbImage: AssetImage('assets/images/flag_usa.png'),
              ),
          ],
        ),
        
        const SizedBox(
          height: 10,
        ),
        const Divider(),
        const SizedBox(
          height: 10,
        ),
        //material disabled switch
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Material Switch', 
              style: TextStyle(fontSize:20.0),
            ),
            Switch(
              value: false, 
              onChanged: null,
            ),
          ],
        ),
        
      ],
    )
  
    ); 
  
  }
}